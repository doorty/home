class Role < ActiveRecord::Base
  has_and_belongs_to_many :users
  
  def self.access_level(role)
		self.find_by_name(role.to_s).try(:access_level)
	end
	
	def self.roles_for_access_level(access)
		self.find(:all, :conditions => "access_level <= " + access.to_s)
	end
	
	def self.assignable_roles(role)
		access = self.access_level(role)
		roles = self.roles_for_access_level(access)
		roles.reject! { |r| r.name == "patient" } if role == :patient
		return roles
	end
	
end