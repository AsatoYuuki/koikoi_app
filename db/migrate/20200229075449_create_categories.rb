class CreateCategories < ActiveRecord::Migration[5.2]
  def change
    create_table :categories do |t|
      t.string :name,null: false, index: true
      t.string :categories, :ancestry,index: true
      t.timestamps
    end
  end
end
