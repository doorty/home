class CareCircle < ActiveRecord::Base
	# care circle connects family via their relationship to the patient: mother, grandmother, etc.
	has_many :relationships
  has_many :users, :through => :relationships
  
  # communications
  has_many :statuses, :dependent => :destroy
	has_many :appointments, :dependent => :destroy
	has_many :medications, :dependent => :destroy
	has_many :notes, :dependent => :destroy
	has_many :doctors, :dependent => :destroy
	has_many :charts, :dependent => :destroy
	accepts_nested_attributes_for :relationships
end
