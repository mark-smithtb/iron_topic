class SetDefaultValues < ActiveRecord::Migration
  def change
    change_column :topics, :interest_count, :integer, default: 0
    change_column :topics, :interest_score, :integer, default: 0
  end
end
