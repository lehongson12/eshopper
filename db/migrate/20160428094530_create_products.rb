class CreateProducts < ActiveRecord::Migration
  def change
    create_table :products do |t|
      t.string :name
      t.string :input_price
      t.string :output_price
      t.integer :category_id
      t.text :description
      t.text :description_mini
      t.string :picture
      t.boolean :is_sale, default: false
      t.boolean :is_new, default: false

      t.timestamps null: false
    end
  end
end
