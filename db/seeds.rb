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
	name=Faker::Lorem.sentence(3,true)
	tdl=List.create!(name: name, 
						 url: Faker::Internet.slug(name , '-'))
	2.times do 
		TaskSimple.create!( description:Faker::Lorem.paragraph,
				  state:['Pendiente','Hecha'].sample,
				  priority:rand(0..2),
				  list: tdl)
	end

	2.times do 
		TaskTemporary.create!( description:Faker::Lorem.characters(50),
				  state:['Pendiente','Hecha','Expirada'].sample,
				  priority:rand(0..2),
				  list: tdl,
				  progress: rand(0..100)				  )
	end

	2.times do 
		t=TaskLong.create!( description:Faker::Lorem.paragraph,
				  state:['Pendiente','En_curso','Hecha'].sample,
				  priority:rand(0..2),
				  list: tdl,
				  date_begin: Faker::Time.between(DateTime.now - 1, DateTime.now),
				  date_end: Faker::Time.between(DateTime.now - 1, DateTime.now)			  )
	
	end


end


p "Created #{List.count} ToDoLists"
p "Created #{Task.count} Tasks"
