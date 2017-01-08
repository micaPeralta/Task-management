class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :description, null: false,
      t.integer :priority , null: false     
      t.string :state  , null: false, :default => 'Pendiente'
     
      t.string :type
      
      t.belongs_to :list, foreign_key: true,  index: true 
      t.integer :progress, :default => 0
      t.date :date_begin, :date_end

      t.timestamps

    end
  end
end
