class CreateGadgetTraits < ActiveRecord::Migration[6.0]
  def change
    create_table :gadget_traits do |t|
      t.belongs_to :gadget, null: false, foreign_key: true
      t.references :trait, null: false, foreign_key: true

      t.timestamps
    end
  end
end
