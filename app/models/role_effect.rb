class RoleEffect < ApplicationRecord
  belongs_to :role
  belongs_to :effect

  scope :active, -> { where(counter: 1..) }
  scope :for_role, ->(role) { where(role: role) }

  def self.increment(role, effect)
    change(role, effect, 1)
  end

  def self.decrement(role, effect)
    change(role, effect, -1)
  end

  private_class_method def self.change(role, effect, delta)
    exec_custom_insert(<<~SQL.strip, {role_id: role.id, effect_id: effect.id, delta: delta, ts: Time.now})
      INSERT INTO role_effects (role_id, effect_id, counter, created_at, updated_at)
      VALUES (:role_id, :effect_id, :delta, :ts, :ts)
      ON CONFLICT (role_id, effect_id)
      DO UPDATE SET counter = counter + excluded.counter, updated_at = excluded.updated_at
    SQL
    nil
  end
end
