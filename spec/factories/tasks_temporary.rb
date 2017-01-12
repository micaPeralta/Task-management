# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  description   :string           not null
#  priority      :string           not null
#  state         :string           not null
#  type          :string
#  to_do_list_id :integer
#  progress      :integer
#  date_begin    :date
#  date_end      :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null
#

FactoryGirl.define do


  factory :taskTemporary do
  		description Faker::Lorem.characters(50)
  		state ['Pendiente','Hecha','Expirada'].sample
		priority rand(0..2)
		list 1
		date_begin Faker::Date.between(9.days.ago,Date.today)
		date_end Faker::Date.between(1.days.ago,5.days.from_now)
  end 
end
