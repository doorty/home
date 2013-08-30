class MedicationReminder < ActiveRecord::Base
  belongs_to :medication
  
  def self.days_of_the_week
  	['Sunday','Monday','Tuesday','Wednesday','Thursday','Friday','Saturday']
  end
  
  def self.time_of_day
  	['Morning', 'Midday', 'Afternoon', 'Evening', 'Night', 'Midnight']
  end
end
