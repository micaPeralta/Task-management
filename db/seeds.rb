# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

#por ahora solo crea listas con tareas normales
#agregar listas con diferentes tareas

Faker::Config.locale='es'

5.times do |i|
	name=Faker::Name.title  
	tdl=List.create!(name: name, 
					url: Faker::Internet.slug(name , '-'))
	2.times do 
		TaskSimple.create!( description:Faker::Lorem.paragraph,
				  state:'Pendiente',
				  priority:rand(0..2),
				  list: tdl)
	end

	2.times do 
		
		t=TaskTemporary.create!( description:Faker::Lorem.characters(50),
				  state:'Pendiente',
				  priority:rand(0..2),
				  list: tdl,
				  date_begin: Faker::Date.between(9.days.ago,Date.today),
				  date_end: Faker::Date.between(1.days.ago,5.days.from_now)	)			  
	end

	2.times do 
		TaskLong.create!( description:Faker::Lorem.paragraph,
				  state:'Pendiente',
				  priority:rand(0..2),
				  list: tdl,
				  progress: 0 )
	
	end


end


p "Created #{List.count} ToDoLists"
p "Created #{Task.count} Tasks"
