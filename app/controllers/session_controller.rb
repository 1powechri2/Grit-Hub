class SessionController < ApplicationController
  def create
    auth = request.env["omniauth.auth"]
    user = User.find_by_provider_and_uid(auth["provider"], auth["uid"]) || User.create_with_omni_auth(auth)
    session[:user_id] = user.id
    binding.pry
    redirect_to current_user_path, :notice => "Signed in!"
  end
end
