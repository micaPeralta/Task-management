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

RSpec.describe Task, type: :model do
  
  	let(:task){FactoryGirl.build(:task)}
  	let(:list){FactoryGirl.build(:list)}
	
	describe '#create' do

		it 'No debe tener campos en blanco' do
			expect(task.valid?).to be_falsy
		end

		it 'con datos validos' do
			task.description= 'Una descripcion'
			task.priority='Alta'
			task.state='Hecha'
			task.to_do_list= list
			expect(task.valid?).to be true

		end
	end
end
