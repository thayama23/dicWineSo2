class CreateWines < ActiveRecord::Migration[5.2]
  def change
    create_table :wines do |t|
      t.text :image
      t.integer :price
      t.string :type
      t.string :variety
      t.string :country
      t.string :origin
      t.string :name
      t.integer :vintage
      t.integer :taste
      t.integer :ranking
      t.text :overview

      t.timestamps
    end
  end
end
