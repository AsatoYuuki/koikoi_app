class CreateAddresses < ActiveRecord::Migration[5.2]
  def change
    create_table :addresses do |t|
      t.integer :post_number
      t.string :prefecture
      t.string :city
      t.string :address
      t.string :building_name
      t.string :cellphone_number
      t.references :user, foreign_key: true, null: true
      t.timestamps
    end
  end
end
