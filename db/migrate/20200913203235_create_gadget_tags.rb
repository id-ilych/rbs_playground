class CreateGadgetTags < ActiveRecord::Migration[6.0]
  def change
    create_table :gadget_tags do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :gadget_tags, :name, unique: true
  end
end
