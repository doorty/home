# Load the rails application.
require File.expand_path('../application', __FILE__)

# Load mail config
SENDGRID = YAML.load_file("#{Rails.root}/config/sendgrid.yml")[Rails.env]

ActionMailer::Base.smtp_settings = {
  :user_name => SENDGRID['user_name'],
  :password => SENDGRID['password'],
  :domain => SENDGRID['domain'],
  :address => SENDGRID['address'],
  :port => SENDGRID['port'],
  :authentication => :plain,
  :enable_starttls_auto => true
}

# Initialize the rails application.
Src::Application.initialize!
