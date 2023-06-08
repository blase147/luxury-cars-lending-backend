class CreateCars < ActiveRecord::Migration[7.0]
  def change
    create_table :cars do |t|
      t.string :name
      t.string :brand
      t.string :image
      t.float :lending_fee
      t.text :description
      t.timestamps
    end
  end
end
