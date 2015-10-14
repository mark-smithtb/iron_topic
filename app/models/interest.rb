class Interest < ActiveRecord::Base
  belongs_to :topic, counter_cache: :interest_count
  belongs_to :user
  has_ancestry
end
