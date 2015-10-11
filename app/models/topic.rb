class Topic < ActiveRecord::Base
  validates :topic, presence: true
  validates :focus_area, presence: true
  validates :description, presence: true
  has_many :interests
  belongs_to :user


  def self.search(search)
    where("topic LIKE ? or focus_area LIKE ?", "%#{search}%" , "%#{search}%")
end
