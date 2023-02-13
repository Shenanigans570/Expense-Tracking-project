class CreateTransactions < ActiveRecord::Migration[7.0]
  def change
    create_table :transactions do |t|
      t.string :vendor_name
      t.string :amount_spent
      t.belongs_to :user, null: false
      t.belongs_to :asset, null: false
      t.timestamps
    end
  end
end
