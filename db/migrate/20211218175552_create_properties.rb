class CreateProperties < ActiveRecord::Migration[6.1]
  def change
    create_table :properties do |t|
      t.string :state
      t.string :address
      t.string :property_type
      t.string :city
      t.string :county
      t.string :neighborhood
      t.integer :sqft
      t.float :beds
      t.float :baths
      t.integer :price
      t.float :lat
      t.float :lon
      t.string :image
      t.string :status
      t.timestamps
    end
  end
end
