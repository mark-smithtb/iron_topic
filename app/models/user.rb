class User < ActiveRecord::Base
  has_many :topics
  has_many :interests
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
  :recoverable, :rememberable, :trackable, :validatable,
  :omniauthable, omniauth_providers: [:github]

  def self.from_omniauth(auth)
    user = where(provider: auth['provider'], uid: auth['uid']).first_or_create
    client = Octokit::Client.new({ access_token: auth.credentials.token, client_id: ENV['GITHUB_APP_ID'] , client_secret: ENV['GITHUB_APP_SECRET']})
    byebug
    user.name         = auth.info.name
    user.email        = auth.info.email
    user.nickname     = auth.info.nickname
    user.access_token = auth.credentials.token
    user.password     = Devise.friendly_token[0,20]
    if client.organization_member?('2015augbackendtiytest', auth.info.nickname)
      if client.organization_membership('2015augbackendtiytest').role == "admin"
        user.admin = true
      end
      user.org = 'backend'
    elsif client.organization_member?('2015augfrontendtiytest', auth.info.nickname)
      if client.organization_membership('2015augfrontendtiytest').role == "admin"
        user.admin = true
      end
      user.org = 'front end'
    end

    user.save!

    return user
  end
end
