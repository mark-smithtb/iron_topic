class AddToInterests < ActiveRecord::Migration
  def change
    add_column :interests, :interestable_id, :integer
    add_column :interests, :interestable_type, :string
    add_column :interests, :ancestry, :string
    add_index :interests, :ancestry
  end
end
