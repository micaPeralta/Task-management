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
				cookies.permanent.signed[NAME] += ' '+data.to_s
				if content_array.size > MAX
				 return cookie_delete_data(data.to_s)
				end
				nil
			end

			def cookie_delete_data(data)
				
					a=content_array
					eliminate=a.shift
					cookies.permanent.signed[NAME]=a.join(' ')
					return eliminate
				
				
			end

			private 

			def content_array
				cookies.permanent.signed[NAME].split(' ')
			end

			def init
				 cookies.permanent.signed[NAME] = " "
			     return []
			end

end