module	CookieHelper
		
		NAME = :ids
		MAX  = 5

		
			def lists_browser()

				if (cookies[NAME].blank?)
			       return init
			    else 
			        return content_array
			    end

			end

			def cookie_add_data(data)
				#si se pasó del nro maximo permitido de listas
				# elimina la 1ra lista y returna su id

				cookies.permanent[NAME] += ' '+data.to_s
				if content_array.size > stored_maximum
				  return cookie_delete_first(data.to_s)
				end
				nil
				
			end

			def cookie_delete_first(data)
				
					a=content_array
					eliminado=a.shift
					cookies.permanent[NAME]= ' '+a.join(' ')

					return eliminado
				
			end

			def cookie_delete_data(data)
				
					to_eliminate=cookies.permanent[NAME]
					to_eliminate.slice!(" "+data.to_s)
					cookies.permanent[NAME]=to_eliminate
							
			end

			private 

			def content_array
			
				cookies.permanent[NAME].split(' ')

			end

			def init
				 cookies.permanent[NAME] = ""
			     return []
			end

end