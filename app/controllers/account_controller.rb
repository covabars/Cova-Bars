class AccountController < ApplicationController
  def login
  end

#  def authenticate
#    self.logged_in_user = User.authenticate(params[:user][:username], params[:user][:password])
#    if is_logged_in?
#      redirect_to index_url
#    else
#      flash[:error] = "I'm sorry, either your username or password are incorrect"
#    end
#  end

# CODE ABOVE IS THE ORIGINAL, WHICH USES USERNAME AND PASSWORD TO LOG IN
# CODE BELOW IS NEW, AND USES EMAIL AND PASSWORD TO LOG IN

  def authenticate
    self.logged_in_user = User.authenticate(params[:user][:email], params[:user][:password])
    if is_logged_in?
      #redirect_to index_url
      redirect_to :controller => 'pages', :action => 'admin'
    else
      flash[:error] = "I'm sorry, either your email or password are incorrect"
      redirect_to :controller => 'account', :action => 'login'
    end
  end

  def logout
    if request.post?
      reset_session
      flash[:notice] = "You have been logged out"
    end
    redirect_to index_url
  end

end
