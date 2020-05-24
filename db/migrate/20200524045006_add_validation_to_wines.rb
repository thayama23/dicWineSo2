class AddValidationToWines < ActiveRecord::Migration[5.2]
  def change
    change_column :wines, :price, :integer, null: false, numericality: { greater_than: 0 }
  end
end

