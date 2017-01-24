FactoryGirl.define do


  factory :taskTemporary do
  		description Faker::Lorem.characters(50)
  		state 'Pendiente'
		priority 'Alta'
		list_id 1
		date_begin Faker::Date.between(9.days.ago,Date.today)
		date_end Faker::Date.between(1.days.from_now,10.days.from_now)
  end 
end
