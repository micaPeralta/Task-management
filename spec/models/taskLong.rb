

require 'rails_helper'

RSpec.describe List, type: :model do


	let(:taskLong){FactoryGirl.create(:taskLong)}
	
	describe 'Progreso' do


		it 'menor al rango válido.' do
			taskLong.update(progress: -1)
			expect(taskLong.errors[:progress].size).to eq(1)
		end

		it 'mayor al rango válido.' do
			taskLong.update(progress: 298)
			expect(taskLong.errors[:progress].size).to eq(1)
		end

		it 'dentro del rango válido.' do
			taskLong.update(progress: )
			expect(taskLong.errors[:progress].size).to eq(1)
		end


		it { should validate_presence_of(:progress).with_message('You must enter progress')

		it { should validate_inclusion_of(:progress).in_range(1..100).with_message("Invalid progress [0-100]") } 

		it { should validate_numericality_of(:progress) }


	end

	describe 'Estado' do

		it { should validate_inclusion_of(:state).in_array(%w(Pendiente En_curso Hecha)).with_message("The status must be 'Pendiente', 'En_curso' or 'Hecha'") } 

  		it { should validate_presence_of(:state).with_message("You must enter the status") }

  		
  		describe 'Transiciones' do


  		end

  	end





end