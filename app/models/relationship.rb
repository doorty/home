class Relationship < ActiveRecord::Base
  belongs_to :user
  belongs_to :care_circle
  belongs_to :relationship_type
  accepts_nested_attributes_for :relationship_type
end
