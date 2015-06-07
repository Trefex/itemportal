class FixDateValueColumnToItems < ActiveRecord::Migration
  def change
    add_column :items, :dateval_date, :datetime
  end
end
