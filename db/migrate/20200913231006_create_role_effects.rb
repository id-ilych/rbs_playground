class CreateRoleEffects < ActiveRecord::Migration[6.0]
  def change
    create_table :role_effects do |t|
      t.belongs_to :role, null: false, foreign_key: true
      t.references :effect, null: false, foreign_key: true
      t.integer :counter, null: false, default: 0

      t.timestamps
    end
    add_index :role_effects, [:role_id, :effect_id], unique: true
  end
end
