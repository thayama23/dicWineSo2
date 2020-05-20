class RemoveColumnInWine < ActiveRecord::Migration[5.2]
  def change
    remove_column :wines, :vintage, :integer, null: false, default: 0
  end
end
