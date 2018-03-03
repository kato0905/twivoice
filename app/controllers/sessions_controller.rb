class SessionsController < ApplicationController
  def create
  user = User.find_or_create_from_auth_hash(request.env['omniauth.auth'])
# request.env['omniauth.auth']に、OmniAuthによってHashのようにユーザーのデータが格納されている。
  session[:user_id] = user.id
  redirect_to root_path, notice: 'ログインしました'
  end

  def destroy
    session[:oauth_token] = nil
    session[:oauth_token_secret] = nil
    redirect_to root_url, :notice => "サインアウト！"
    if (request.path_info == "/signout_twitter")
      session[:username] = nil
    end
    User.destroy_all
  end
end
