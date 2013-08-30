class SessionsController < ApplicationController
  def create
    begin
      auth = request.env['omniauth.auth']
      user = OauthToken.find_or_create_with_omniauth!(auth)
      session[:oauth_token_id] = user.id
    rescue => e
      return redirect_to root_path, flash: { error: 'Error Occured' }
    end

    redirect_to root_path, notice: 'Signed In'
  end
end
