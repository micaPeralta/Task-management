module	CookieHelper

		NAME= :lists
		
			def lists_browser()
				if (cookies[NAME].blank?)
			       return init
			    else 
			        return content_array
			    end
			end

			def cookie_add_data(data)
				cookies[NAME] += ' '+data.to_s
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