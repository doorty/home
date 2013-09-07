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

Caregiver.create(:id => 1, :email => 'caregiver1@email1.com', :name => 'Kali Burns', 
	:gender => 1, :language => '', :city => 'Des Moines', :state => 'IA', :zip => '50982',
	:description => 'Hello,\rMy name is Kaili and I am a very friendly and easygoing person. I love to stay busy and have fun. I am full time student at Des Moines University.',
	:age => 30, :years_of_experience => 1, :occupation => 'Student', :insured => true, :bonded => true, :reviewed => true)
	
Caregiver.create(:id => 2, :email => 'caregiver2@email2.com', :name => 'Portery McFadden', 
	:gender => 0, :language => '', :city => 'Des Moines', :state => 'IA', :zip => '50301',
	:description => 'Hi my name is Portery McFadden.  I enjoy helping people help themselves.  I view myself as a motivating, positive person.  One of my greatest skills is&#39;',
	:age => 39, :years_of_experience => 15, :occupation => 'Homemaker/Companion', :insured => true, :bonded => true, :reviewed => true)
	
Caregiver.create(:id => 3, :email => 'caregiver3@email3.com', :name => 'Robert Somerson',
	:gender => 0, :language => '', :city => 'Des Moines', :state => 'IA', :zip => '50318',
	:description => 'Hi there, on eight-and-a-half-foot baskets everybody can create. Pretend that you&#39;re Larry Bird, Charles Barkely, Magic Johnson, Cheryl Miller, and, of course, Michael Jordan. Anything is possible: twenty-foot fadeaways, reverse gorilla dunks, alley oops, and sweet drives down the lane. It&#39;s the place where fantasies become realities: top of the key, jab step, cross over, down the gut, split the D, rise to the occasion, double pump, 360-degree right hand &quot;slam jam bam&quot; as Dick Vitale would say. It&#39;s a game of fast breaks, quick shakes, pump fakes, and talking trash in your face.',
	:age => 39, :years_of_experience => 6, :occupation => 'Caregiver', :insured => true, :bonded => true, :reviewed => true)