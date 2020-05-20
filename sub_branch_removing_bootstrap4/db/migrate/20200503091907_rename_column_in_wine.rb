class RenameColumnInWine < ActiveRecord::Migration[5.2]
  def change
    rename_column :wines, :color, :kind
  end
end
