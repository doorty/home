class Medication < ActiveRecord::Base
  belongs_to :care_circle
  has_many :medication_reminders
  accepts_nested_attributes_for :medication_reminders
end
