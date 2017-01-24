module	CookieHelper

		NAME = :lists
		MAX  = 5

		
			def lists_browser()
				if (cookies[NAME].blank?)
			       return init
			    else 
			        return content_array
			    end
			end

			def cookie_add_data(data)
				cookies.permanent[NAME] += ' '+data.to_s
				if content_array.size > MAX
				  cookie_delete_first(data.to_s)
				end
				nil
			end

			def cookie_delete_first(data)
				
					a=content_array
					a.shift
					cookies.permanent[NAME]= a.join(' ')
					
				
				
			end

			def cookie_delete_data(data)
				
					eliminate=cookies.permanent[NAME]
					eliminate.slice!(" "+data.to_s)
					cookies.permanent[NAME]=eliminate
							
				
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