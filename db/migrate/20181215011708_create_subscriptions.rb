class CreateSubscriptions < ActiveRecord::Migration[5.1]
  def change
    create_table :subscriptions do |t|
      t.string :name, unique: true, null: false
      t.string :address, null: false
      t.integer :age, null: false
      t.string :tel, null: false
      t.string :email, null: false

      t.timestamps
    end
  end
end
