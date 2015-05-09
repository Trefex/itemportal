class FixColumnName < ActiveRecord::Migration
  def change
    rename_column :items, :selldata, :selldate
  end
end
