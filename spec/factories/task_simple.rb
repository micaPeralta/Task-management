FactoryGirl.define do

  factory :taskSimple do
  		description Faker::Lorem.characters(50)
  		state 'Pendiente'
		priority [0,1,2].sample
  end 

end