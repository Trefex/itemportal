class ReOrderColumns < ActiveRecord::Migration
  def up
    change_column :items, :dateval_date, :datetime, after: :dateval
  end
end
