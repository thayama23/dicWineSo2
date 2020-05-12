class ChangeColumnsInWine < ActiveRecord::Migration[5.2]
  def up
    change_column :wines, :vintage, 'date USING CAST(vintage AS date)'
  end

  def down
    # change_column :wines, :vintage, :integer, null: false, default: 0
    change_column :wines, :vintage, 'date USING CAST(vintage AS date)'

  end
end

# def change
#   remove_column :wines, :vintage, :integer, null: false, default: 0
#   add_column :wines, :vintage, :date, null: false, default: 0, :after => :name
# end