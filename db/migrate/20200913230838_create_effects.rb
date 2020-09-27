class CreateEffects < ActiveRecord::Migration[6.0]
  def change
    create_table :effects do |t|
      t.string :name, null: false

      t.timestamps
    end
    add_index :effects, :name, unique: true
  end
end
