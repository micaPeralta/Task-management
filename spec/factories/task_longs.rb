FactoryGirl.define do

  factory :taskLong do
  		description Faker::Lorem.characters(50)
  		state 'Pendiente'
		priority [0,1,2].sample
		list_id 1
		progress 0
  end 
end