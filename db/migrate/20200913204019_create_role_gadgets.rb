class CreateRoleGadgets < ActiveRecord::Migration[6.0]
  def change
    create_table :role_gadgets do |t|
      t.belongs_to :role, null: false, foreign_key: true
      t.references :gadget, null: false, foreign_key: true

      t.timestamps
    end
  end
end
