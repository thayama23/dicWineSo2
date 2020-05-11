class ChangeVintageColumnInWines < ActiveRecord::Migration[5.2]
  def up
    change_column_null :wines, :vintage, false, 0
    change_column :wines, :vintage, :integer, default: 0
  end

  def down
    change_column_null :wines, :vintage, true, nil
    change_column :wines, :vintage, :integer, default: nil
  end
end
