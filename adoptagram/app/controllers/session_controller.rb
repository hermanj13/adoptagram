class SessionController < ApplicationController
  skip_before_action :logged_in, except: [:logout]
  def index
  end

  def agency
  end

  def login
    if params[:type] == "agency"
      if agency = Agency.find_by(username: params[:username])
        agency = agency.authenticate(params[:password])
        if agency
          session[:id] = agency.id
          session[:type] = "agency"
          redirect_to "/agency/#{agency.id}/dashboard"
        else
          flash[:notice] = ["Invalid Password"]
          redirect_to "/agency"
        end
      else
        flash[:notice] = ["Invalid Username"]
        redirect_to "/agency"
      end
    elsif params[:type] == "user"
      if user = User.find_by(username: params[:username])
        user = user.authenticate(params[:password])
        if user
          session[:id] = user.id
          session[:type] = "user"
          redirect_to "/dashboard"
        else
          flash[:notice] = ["Invalid Password"]
          redirect_to "/"
        end
      else
        flash[:notice] = ["Invalid Username"]
        redirect_to "/"
      end
    end
  end

  def register
    if params[:type] == "agency"
      agency = Agency.new(name: params[:name], username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation], email: params[:email], website: params[:website])
      if agency.save
        session[:id] = agency.id
        session[:type] = "agency"
        redirect_to "/agency/#{agency.id}/dashboard"
      else
        flash[:notice] = agency.errors.full_messages
        redirect_to '/agency'
      end
    elsif params[:type] == "user"
      user = User.new(username: params[:username], password: params[:password], password_confirmation: params[:password_confirmation], email: params[:email])
      if user.save
        session[:id] = user.id
        session[:type] = "user"
        redirect_to '/dashboard'
      else
        flash[:notice] = user.errors.full_messages
      end
    end
  end

  def logout
    reset_session
    redirect_to '/'
  end
end
