class CreateAssets < ActiveRecord::Migration[7.0]
  def change
    create_table :assets do |t|
      t.string :investment_name
      t.decimal :investment_amount
      t.integer :user_id, null: false
      t.timestamps
    end
  end
end
