class MedicationReminder < ActiveRecord::Base
  belongs_to :medication
  serialize :days, Array
  
  def self.days_of_the_week
  	['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday']
  end

end
