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
 
  it { should validate_presence_of(:name).with_message("You must enter a name") }
  #validad expresion regular



	describe '#Creacion' do
	  

	  let(:list1){FactoryGirl.build(:list)}
  	  let(:list2){FactoryGirl.build(:list)}

	  it 'Debe fallar la validacion precencia del campo name' do 
		list1.name=''
		expect(list1.valid?).to be_falsy
	  end 

	  it 'Debe respetarse la unicidad de los slugs'do 
	  	list1.name='una lista cualquiera'
	  	list1.save
	  	list2.name='otra lista cualquiera'
	  	expect(list2.valid?).to be true
	  end

	  it 'Debe haber un  conflicto con la  unicidad de los slugs'do 
	  	list1.name='una lista cualquiera'
	  	list1.save
	  	list2.name='una lista cualquiera'
	  	expect(list2.valid?).to be_falsy
	  end


	end

	describe 'Ordenamiento de tareas' do

		let(:task1){FactoryGirl.build(:taskTemporary)}
		let(:task2){FactoryGirl.build(:taskSimple)}
		let(:task3){FactoryGirl.build(:taskLong)}
		let(:task4){FactoryGirl.build(:taskTemporary)}

  		let(:list){FactoryGirl.build(:list)}

		it 'De diferentes tipos, con diferentes prioridades' do 
 			task1.update(priority:'Alta')
 			task2.update(priority:'Media')
 			task3.update(priority:'Baja')
 			task4.update(priority:'Media')
 			#Lista desordenada => [ Alta, Baja,Media,Media]
			list.tasks= [task1,task3,task2,task4]

			# Lista Ordenada > [ Alta,Media, Media, Baja]
			list_ordered= [task1,task4,task2,task3]
			expect(list.tasks).to match_array list_ordered

			

		end
	end

	describe '#Last_update' do

		let(:list1){FactoryGirl.build(:list)}
		

		let(:task1){FactoryGirl.build(:taskTemporary)}
		let(:task2){FactoryGirl.build(:taskSimple)}
		let(:task3){FactoryGirl.build(:taskLong)}
		let(:task4){FactoryGirl.build(:taskTemporary)}

		context 'cuando tiene tareas' do  

			it 'updated_at mayor en las tareas' do
							
				task1.updated_at='2017-01-05'
				task2.updated_at='2017-01-03'
				task3.updated_at='2017-01-08'
				task4.updated_at='2017-01-10'

				list1.tasks= [task1,task3,task2,task4]
				list1.update(updated_at:'2017-01-01')
				expect(list1.last_update).to eq('2017-01-10')


			end


			it 'updated_at mayor en la lista' do
							
				task1.updated_at='2017-01-05'
				task2.updated_at='2017-01-03'
				task3.updated_at='2017-01-08'
				task4.updated_at='2017-01-10'

				list1.tasks= [task1,task3,task2,task4]
				list1.update(updated_at:'2017-01-20')
				expect(list1.last_update).to eq('2017-01-20')
			end
		end

		it 'cuando no tiene tareas' do
			list1.update(updated_at:'2017-01-01')
			expect(list1.last_update).to eq('2017-01-01')
		end
	end

end
