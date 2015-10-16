class AddOrgToTopics < ActiveRecord::Migration
  def change
    add_column :topics, :org, :string
  end
end
