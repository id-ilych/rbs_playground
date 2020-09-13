class CreateGadgetGadgetTags < ActiveRecord::Migration[6.0]
  def change
    create_table :gadget_gadget_tags do |t|
      t.belongs_to :gadget, null: false, foreign_key: true
      t.references :gadget_tag, null: false, foreign_key: true

      t.timestamps
    end
  end
end
