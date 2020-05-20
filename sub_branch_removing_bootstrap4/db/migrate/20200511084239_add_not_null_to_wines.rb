class AddNotNullToWines < ActiveRecord::Migration[5.2]
  def change
    change_column :wines, :image, :text, null: false
    change_column :wines, :price, :integer, null: false
    change_column :wines, :kind, :string, null: false
    change_column :wines, :country, :string, null: false
    change_column :wines, :origin, :string, null: false
    change_column :wines, :name, :string, null: false
    change_column :wines, :ranking, :integer, null: false
  end 
end
