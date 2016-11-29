# == Schema Information
#
# Table name: to_do_lists
#
#  id         :integer          not null, primary key
#  name       :string           not null
#  url        :string           not null
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

FactoryGirl.define do
  factory :to_do_list do
    n= Faker::Lorem.sentence(3,true)
    name n
    url  Faker::Internet.slug(n , '-')
  end
end
