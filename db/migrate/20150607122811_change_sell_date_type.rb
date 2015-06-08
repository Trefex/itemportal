class ChangeSellDateType < ActiveRecord::Migration
  def up
    change_column :items, :selldate, :date
  end

  def down
    change_column :items, :selldate, :datetime
  end
end
