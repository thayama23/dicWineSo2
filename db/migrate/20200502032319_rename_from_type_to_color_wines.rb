class RenameFromTypeToColorWines < ActiveRecord::Migration[5.2]
  def change
    rename_column :wines, :type, :color
  end
end
