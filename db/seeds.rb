# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

#Role.create([{name : 'CaseManager'}, {name : 'Patient'}, {name : ''}, {name : 'FriendsFamily'}]
[['friends_family', 20], ['patient', 20], ['case_manager', 30], ['case_manager_admin', 30], ['admin', 50]].each do |role, access|
  Role.find_or_create_by_name_and_access_level(role, access)
end

['Friend', 'Mother', 'Father', 'Grandmother', 'Grandfather', 'Husband', 'Wife', 'Brother', 'Sister', 'Son', 'Daughter', 'Uncle', 'Aunt', 'Cousin', 'Nephew', 'Niece', 'Father-in-law', 'Mother-in-law', 'Brother-in-law', 'Sister-in-law'].each do |relation|
  RelationshipType.find_or_create_by_name(relation)
end