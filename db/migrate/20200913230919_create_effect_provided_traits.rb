class CreateEffectProvidedTraits < ActiveRecord::Migration[6.0]
  def change
    create_table :effect_provided_traits do |t|
      t.belongs_to :effect, null: false, foreign_key: true
      t.references :trait, null: false, foreign_key: true

      t.timestamps
    end
  end
end
