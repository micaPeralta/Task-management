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

require 'rails_helper'

RSpec.describe ToDoList, type: :model do
 
 describe '#create' do
	  
	  let(:to_do_list1){FactoryGirl.build(:to_do_list)}
  	  let(:to_do_list2){FactoryGirl.build(:to_do_list)}

	  it 'debe fallar la validacion precencia del campo name' do 
		to_do_list1.name=''
		expect(to_do_list1.valid?).to be_falsy
	  end 

	  it 'el nombre de la lista debe ser único'do 
	  	to_do_list1.name='una lista cualquiera'
	  	to_do_list1.save
	  	to_do_list2.name='una lista cualquiera'
	  	expect(to_do_list2.valid?).to be_falsy
	  end
	end
end
