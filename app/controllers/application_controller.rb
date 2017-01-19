class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception
  before_action :set_locale
 
  include LocaleHelper

   #rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

   #def record_not_found
    #render :text => "404: Resource not found", :status => 404
  	#end

end
