class PagesController < ApplicationController
  def home
  	if current_user.present?
  		@services = current_user.services.order(created_at: :desc).limit(4)
  	else
  		@services = Service.all.order(created_at: :desc).limit(4)
  	end
  end
end
