FactoryGirl.define do

  factory :taskLong do
  		description Faker::Lorem.characters(50)
  		state 'Pendiente'
		priority ['Alta','Media','Baja'].sample
		progress 0
  end 
end