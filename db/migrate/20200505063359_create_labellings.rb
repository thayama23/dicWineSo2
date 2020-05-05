class CreateLabellings < ActiveRecord::Migration[5.2]
  def change
    create_table :labellings do |t|
      t.integer :wine_id
      t.integer :lable_id

      t.timestamps
    end
  end
end
