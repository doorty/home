json.array!(@caregivers) do |caregiver|
  json.extract! caregiver, :email, :name, :city, :state, :zip, :description, :age, :years_of_experience, :occupation, :insured, :bonded, :reviewed
  json.url caregiver_url(caregiver, format: :json)
end