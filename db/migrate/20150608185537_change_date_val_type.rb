class ChangeDateValType < ActiveRecord::Migration
  def up
    change_column :items, :dateval_date, :date
  end

  def down
    change_column :items, :dateval_date, :datetime
  end
end
