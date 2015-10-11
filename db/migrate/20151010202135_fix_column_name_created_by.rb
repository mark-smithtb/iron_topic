class FixColumnNameCreatedBy < ActiveRecord::Migration
  def change
    rename_column :interests, :created_by, :user_id
    rename_column :topics, :created_by, :user_id
  end
end
