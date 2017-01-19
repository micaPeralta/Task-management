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
				cookies[NAME] += ' '+data.to_s
				cookie_delete_data(data.to_s)

			end

			def cookie_delete_data(data)
				if content_array.size > MAX
					a=content_array
					eliminate=a.shift
					cookies[NAME]=a.join(' ')
					return eliminate
				end
				nil
			end

			private 

			def content_array
				cookies[NAME].split(' ')
			end

			def init
				 cookies[NAME]=""
			     return []
			end

end