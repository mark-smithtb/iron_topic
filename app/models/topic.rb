class Topic < ActiveRecord::Base
  has_many :interests
  belongs_to :user
  paginates_per 10


  def self.search(search)
    where("title LIKE ? or focus_area LIKE ?", "%#{search}%" , "%#{search}%")
  end

end
