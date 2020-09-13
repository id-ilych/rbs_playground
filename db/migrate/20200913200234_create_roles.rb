class CreateRoles < ActiveRecord::Migration[6.0]
  def change
    create_table :roles do |t|
      t.string :name, null: false
      t.string :description, null: false
      t.belongs_to :user, null: false, foreign_key: true

      t.timestamps
    end
    add_index :roles, :name, unique: true
  end
end
