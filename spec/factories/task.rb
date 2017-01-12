FactoryGirl.define do


  factory :task do
  		description Faker::Lorem.characters(50)
  		state 'Pendiente'
		priority rand(0..2)
		list 1
		date_begin Faker::Date.between(9.days.ago,Date.today)
		date_end Faker::Date.between(1.days.ago,5.days.from_now)
  end 
end