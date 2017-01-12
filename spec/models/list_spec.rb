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
	  

	  let(:list1){FactoryGirl.build(:list)}
  	  let(:list2){FactoryGirl.build(:list)}

	  it 'debe fallar la validacion precencia del campo name' do 
		list1.name=''
		expect(list1.valid?).to be_falsy
	  end 

	  it 'Con nombre que respete la unicidad de los slugs'do 
	  	list1.name='una lista cualquiera'
	  	list1.save
	  	list2.name='otra lista cualquiera'
	  	expect(list2.valid?).to be true
	  end

	  it 'Con nombre que cause un conflicto de unicidad de los slugs'do 
	  	list1.name='una lista cualquiera'
	  	list1.save
	  	list2.name='una lista cualquiera'
	  	expect(list2.valid?).to be_falsy
	  end


	end
end
