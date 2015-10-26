class Topic < ActiveRecord::Base
  has_many :interests, dependent: :delete_all
  belongs_to :user
  paginates_per 10


  def self.search(search, scope)
    case
    when scope == "all"
      where("title LIKE ? or focus_area LIKE ?", "%#{search}%" , "%#{search}%")
    when scope == "user"
      user = User.find_by("name Like ?", "%#{search}%").id
      where("user_id LIKE ?", "%#{user}%")
    when scope == "title"
      where("title Like ?", "%#{search}%")
    when scope == "focus_area"
      where("focus_area Like ?", "%#{search}%")
    else
      where("title LIKE ? or focus_area LIKE ?", "%#{search}%" , "%#{search}%")
    end
  end

  def self.visable_by(user)
    unless user.admin?
      where("org = ? or (org is null)", user.org)
    else
      all
    end
  end

end
