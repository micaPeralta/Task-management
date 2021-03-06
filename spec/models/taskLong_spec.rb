

require 'rails_helper'

RSpec.describe TaskLong, type: :model do

	let(:taskLong){FactoryGirl.create(:taskLong, :list => FactoryGirl.create(:list))}


	describe 'Progreso' do


		it 'menor al rango válido.' do
			taskLong.progress= -1
			taskLong.valid?
			expect(taskLong.errors[:progress].size).to eq(1)
		end

		it 'mayor al rango válido.' do
			taskLong.update(progress: 298)
			expect(taskLong.errors[:progress].size).to eq(1)
		end

		it 'dentro del rango válido.' do
			taskLong.progress=45
			taskLong.valid?
			expect(taskLong.errors[:progress].size).to eq(0)
		end


		it { should validate_presence_of(:progress).with_message('You must enter progress')}

		it { should validate_inclusion_of(:progress).in_range(0..100).with_message("Invalid progress [0-100]") } 

		it { should validate_numericality_of(:progress).with_message('Progress must be an integer') }

	end

	describe 'Estado' do

		it { should validate_inclusion_of(:state).in_array(%w(Pendiente En_curso Hecha)).with_message("The status must be 'Pendiente', 'En_curso' or 'Hecha'") } 

  	it { should validate_presence_of(:state).with_message("You must enter the status") }

  	describe 'Cambios de estado' do

  			describe '#finish' do 
  				
  				it 'Desde Pendiente ' do
  					taskLong.state='Pendiente'
  					expect(taskLong.may_finish?).to be false
  				end

  				it 'Desde En_curso ' do
  					taskLong.state='En_curso'
  					expect(taskLong.may_finish?).to be true
  				end


  			end

  			describe '#init' do 
  				
  				it 'Desde Pendiente ' do
  					taskLong.state='Pendiente'
  					expect(taskLong.may_init?).to be true
  				end

  				it 'Desde En_curso ' do
  					taskLong.state='En_curso'
  					expect(taskLong.may_init?).to be false
  				end

  				it 'Desde Hecha ' do
  					taskLong.state='Hecha'
  					expect(taskLong.may_init?).to be false
  				end

  			end

        describe 'cuando se cambia el progreso debe cambiar el estado'  do

          it 'progreso mayor a 0 y menor a cien' do
           
            taskLong.update(progress: 45)
            expect(taskLong.state).to eq 'En_curso'

          end

           it 'progreso igual a 100 con estado pendiente' do
           
            taskLong.update(progress: 100)
            expect(taskLong.state).to eq 'Pendiente'
            
          end

          it 'progreso igual a 100 con estado En_curso' do
            #debe pasar primero por el estado 'En_curso'
            taskLong.update(progress: 34)
            taskLong.update(progress: 100)
            expect(taskLong.state).to eq 'Hecha'
            
          end

        end 

  		end

  	end





end