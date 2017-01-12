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

require 'rails_helper'

RSpec.describe taskTemporary type: :model do
  

	describe '#create' do

		let(:taskTemporary){FactoryGirl.build(:taskTemporary)}
  		let(:list){FactoryGirl.build(:list)}
	
		it 'Sin ningún dato' do
			expect(taskTemporary.valid?).to be_falsy
		end

		it 'Con datos válidos.' do
			taskTemporary.description= 'Una descripcion'
			taskTemporary.priority='Alta'
			taskTemporary.state='Hecha'
			taskTemporary.list= list
			expect(taskTemporary.valid?).to be true


		end

		it 'La creación de una tarea temporal con un rango de validez invertido (fecha de inicio mayor a
			fecha de fin)' do
			taskTemporary.date_begin= '2017-12-09'
			taskTemporary.date_end= '2017-10-11'
			expect(taskTemporary.valid?).to be false

		end

	end

	describe 'Ordenamiento de tareas' do

		let(:task1){FactoryGirl.build(:task)}
		let(:task2){FactoryGirl.build(:task)}
		let(:task3){FactoryGirl.build(:task)}
		let(:task4){FactoryGirl.build(:task)}

  		let(:list){FactoryGirl.build(:list)}

		it 'De diferentes tipos, con diferentes prioridades' do 

			list.tasks.addAll(%( task1 task3 task4 task2))

		end
	end


	describe 'Cambios de estado' do
		it 'El pasaje de una tarea temporal a estado “expirada” ' do

		end
	end

	describe '' do

		it 'La actualización de una tarea larga con porcentajes dentro y fuera del rango válido.' do

		end
	end

end
