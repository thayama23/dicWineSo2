class AmendPriceColumnWines < ActiveRecord::Migration[5.2]
  def change
    def up
      change_column :wines, :price, :integer, null: false
    end

    def down
      change_column :wines, :price, :integer, null: false, numericality: { greater_than: 0 }
    end
  end
end
