class FixTables < ActiveRecord::Migration
  def change
    remove_column :comments, :post_id
    add_column :comments, :user_id, :integer
    add_column :comments, :submission_id, :integer
    add_column :submissions, :user_id, :integer
  end
end
