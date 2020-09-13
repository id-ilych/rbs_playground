class CreateWallets < ActiveRecord::Migration[6.0]
  def change
    create_table :wallets do |t|
      t.integer :credits, null: false, default: 0
      t.belongs_to :role, null: false, foreign_key: true

      t.timestamps
    end
  end
end
