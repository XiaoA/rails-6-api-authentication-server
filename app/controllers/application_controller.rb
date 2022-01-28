class ApplicationController < ActionController::API
  def render_jsonapi_response(resource)
    if resource.errors.empty?
      render jsonapi: resource
    else
      render jsonapi_errors: resource.errors, status: 400
    end
  end

  def authenticate_user!
    if user_signed_in?
      @user = current_user
    else
      head :unauthorized
    end 
  end 
end
