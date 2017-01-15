module	CookieHelper
		
			def lists_browser()
				if (!cookies[:lasts].blank?)
			      cookies[:lasts][0]=""
			      return cookies[:lasts].split(',')
			    else 
			      cookies[:lasts]=""
			      return []
			    end
			end

			def cookie_add_data(data)
				cookies[:lasts]=cookies[:lasts] + ','+data.to_s
			end

		

end