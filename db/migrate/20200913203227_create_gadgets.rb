class CreateGadgets < ActiveRecord::Migration[6.0]
  def change
    create_table :gadgets do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :gadgets, :name, unique: true
  end
end
