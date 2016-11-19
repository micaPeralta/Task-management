class CreateTasks < ActiveRecord::Migration[5.0]
  def change
    create_table :tasks do |t|
      t.string :description, null: false
      t.string :priority , null: false     
      t.string :state  , null: false
     
      t.string :type
      
      t.belongs_to :to_do_list, foreign_key: true,  index: true 
      t.integer :progress 
      t.date :date_begin, :date_end

      t.timestamps

    end
  end
end
