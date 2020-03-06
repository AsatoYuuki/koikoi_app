class CreateItems < ActiveRecord::Migration[5.2]
  def change
    create_table :items do |t|
      t.text :name, null: false
      t.text :content, null: false
      t.integer :price, null: false
      t.string :size
      t.string :condition, null: false
      t.string :send_cost, null: false
      t.string :send_method, null: false
      t.string :send_place, null: false
      t.string :send_day, null: false
      t.integer :buyer_id
      t.integer :user_id, null:false , foreign_key: true
      t.integer :status, default: 0
      t.integer :brand_id, foreign_key: true
      t.integer :category_id, foreign_key: true
      t.timestamps
    end
  end
end
