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

50.times do |i|
	name=Faker::Lorem.sentence(3,true)
	tdl=ToDoList.create!(name: name, 
						 url: Faker::Internet.slug(name , '-'))
	5.times do 
		Task.create!( description:Faker::Lorem.paragraph,
				  state:['pendiente','hecha'].sample,
				  priority:['alta','media','baja'].sample,
				  to_do_list: tdl)
	end
end


p "Created #{ToDoList.count} ToDoLists"
p "Created #{Task.count} Tasks"
