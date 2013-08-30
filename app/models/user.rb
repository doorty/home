class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :omniauthable,
         :recoverable, :rememberable, :trackable, :validatable,
         :invitable
  
  # so that all users have a role defined
  before_create :setup_default_role
  
  # different type of user roles       
  has_and_belongs_to_many :roles
  
  # care circle connects family via their relationship to the patient: mother, grandmother, etc.
  has_many :relationships
  has_many :care_circles, :through => :relationships
  accepts_nested_attributes_for :care_circles, :relationships
  
  # get access to who I invited
  has_many :invitations, :class_name => self.to_s, :as => :invited_by
  
  # store third-party logins
  has_many :authentications
  
  # store other user information
  has_one :profile, :dependent => :destroy
	accepts_nested_attributes_for :profile
	
	def facebook
		@facebook ||= Koala::Facebook::API.new(self.authentications.find_by_provider('facebook').try(:oauth_token))
		block_given? ? yield(@facebook) : @facebook
		rescue Koala::Facebook::APIError => e
		logger.info e.to_s
		nil # or consider a custom null object
	end
	
	# get user's facebook friends
	def fb_friends
	  facebook { |fb| 
	  	fb.get_connection("me", "friends").sort { |a,b| a["name"].downcase <=> b["name"].downcase }.each do |f|
			#  f["image"]= fb.get_picture(f["id"])
			end
	  }
	end
	
	# get user's facebook profile
	def fb_profile
	  facebook { |fb| fb.get_object("me") }
	end

  # user.role? :case_manger || :patient || :friends_family || :case_manager_admin || :admin
  def role?(role)
    self.roles.exists?(:name => role.to_s)
	end

	# define the default role (when noone is set)
  def setup_default_role
    # the default role [1] is friends & family
    self.role_ids = [1] if self.role_ids.empty? 
  end

end
