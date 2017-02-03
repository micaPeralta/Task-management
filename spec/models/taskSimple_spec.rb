require 'rails_helper'

RSpec.describe TaskSimple, type: :model do

  let(:taskSimple){FactoryGirl.create(:taskSimple, :list => FactoryGirl.create(:list))}

  
	describe 'estado' do

		it { should validate_presence_of(:state).with_message("You must enter the status") }
		it { should validate_inclusion_of(:state).in_array(%w(Pendiente  Hecha)).with_message("The status must be 'Pendiente' or 'Hecha'") } 

		describe '#finish' do 

			it 'Desde Pendiente ' do
  				taskSimple.state='Pendiente'
  				expect(taskSimple.may_finish?).to be true
  			end

  			it 'Desde Hecha ' do
  				taskSimple.state='Hecha'
  				expect(taskSimple.may_finish?).to be false
  			end

  		   it 'Finish' do
  		   		taskSimple.state='Pendiente'
  		   		taskSimple.finish
  				expect(taskSimple.state).to eq 'Hecha'
  		   end
  		   
		end

	end
  
end