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
#

FactoryGirl.define do
  factory :task do
    
  end
end
