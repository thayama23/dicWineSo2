class AddColumnToWine < ActiveRecord::Migration[5.2]
  def change
    add_column :wines, :vintage, :date, null: false, default: "2020-05-12", :after => :name
  end
end
