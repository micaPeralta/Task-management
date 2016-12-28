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

RSpec.describe List, type: :model do
 
 describe '#create' do
	  
	  let(:to_do_list1){FactoryGirl.build(:list)}
  	  let(:to_do_list2){FactoryGirl.build(:list)}

	  it 'debe fallar la validacion precencia del campo name' do 
		list1.name=''
		expect(list1.valid?).to be_falsy
	  end 

	  it 'el nombre de la lista debe ser único'do 
	  	list1.name='una lista cualquiera'
	  	list1.save
	  	list2.name='una lista cualquiera'
	  	expect(list2.valid?).to be_falsy
	  end
	end
end
