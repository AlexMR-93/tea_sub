class CreateSubscriptions < ActiveRecord::Migration[5.2]
  def change
    create_table :subscriptions do |t|
      t.references :customer, foreign_key: true
      t.references :tea, foreign_key: true
      t.string :title
      t.decimal :price, precision: 3, scale: 2
      t.string :status
      t.integer :frequency

      t.timestamps
    end
  end
end
