# == Schema Information
#
# Table name: tasks
#
#  id            :integer          not null, primary key
#  description   :string           not null
#  priority      :string           not null
#  state         :string           not null
#  type          :string
#  ist_id :integer
#  progress      :integer
#  date_begin    :date
#  date_end      :date
#  created_at    :datetime         not null
#  updated_at    :datetime         not null

require 'rails_helper'


RSpec.describe TaskTemporary, type: :model do

	let(:taskTemporary){FactoryGirl.build(:taskTemporary)}
  	let(:list){FactoryGirl.build(:list)}

	describe 'validaciones' do

		it { should belong_to(:list) }

		it { should validate_inclusion_of(:state).in_array(%w(Pendiente Hecha Expirada)).with_message("The status must be 'Pendiente', 'En_curso' or 'Hecha'") } 
		
		#it { should validate_inclusion_of(:priority).in_array(%w(Alta Media Baja)).with_message("The priority should be 'Alta', 'Media' or 'Baja'") } 

		it { should validate_length_of(:description).is_at_most(256).with_message("The description must contain less than 256 characters") }

	end

	describe 'creacion' do

		
	
		it 'Debería fallar sin datos' do
			taskTemporary.description=''
			taskTemporary.state=''
			taskTemporary.priority=''
			taskTemporary.date_end=''
			taskTemporary.date_begin=''
			expect(taskTemporary.valid?).to be_falsy
		end

		it 'Debería  funcionar con datos validos ' do
			taskTemporary.description= 'Una descripcion'
			taskTemporary.priority='Alta'
			taskTemporary.state='Hecha'
			taskTemporary.list= list
			expect(taskTemporary.valid?).to be true


		end

		
	end

	describe 'Fechas' do

		
		it { should validate_presence_of(:date_begin).with_message('You must enter the begin date') }

		it { should validate_presence_of(:date_end).with_message('You must enter the end date') }


		it 'Debería fallar  con fecha de validez invertido (fecha de inicio mayor a
			fecha de fin)' do
			taskTemporary.date_begin= '2017-12-09'
			taskTemporary.date_end= '2017-10-11'
			taskTemporary.valid?
			expect(taskTemporary.errors[:date_begin].size).to eq(1)

		end


		it 'Debería fallar  con fecha de fin igual a fecha actual' do
			taskTemporary.date_begin= '2017-12-09'
			taskTemporary.date_end= Date.current
			expect(taskTemporary.invalid?).to eq(true)
		end

		it 'Debería fallar  con fecha de fin igual a fecha de fin' do
			taskTemporary.date_begin= '2017-12-09'
			taskTemporary.date_end= '2017-12-09'
			expect(taskTemporary.invalid?).to eq(true)
		end

	end
	


	describe 'Cambios de estado' do
		it 'El pasaje de una tarea temporal a estado “expirada” ' do

		end
	end



end
