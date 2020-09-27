class CreateEffectDisabledGadgetTags < ActiveRecord::Migration[6.0]
  def change
    create_table :effect_disabled_gadget_tags do |t|
      t.belongs_to :effect, null: false, foreign_key: true
      t.references :gadget_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
