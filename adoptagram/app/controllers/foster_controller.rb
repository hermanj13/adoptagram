class FosterController < ApplicationController
  def index
    @applications = FosterApplication.where(agency_id: params[:agency_id])
  end

  def create
    newApplication = FosterApplication.new(agency_id: parmas[:agency_id], anaimal_id: params[:animal_id], user_id: current_user.id)
    if newApplication.save
      redirect_to "/animal/#{params[:animal_id]}"
    else
      flash[:notice] = newApplication.errors.full_messages
      redirect_to "/animal/#{params[:animal_id]}"
    end
  end

  def show
    @application = FosterApplication.find(params[:foster])
  end

  def update
    application = FosterApplication.find(params[:foster])
    if application.update(comments: params[:comments])
      redirect_to ("/agency/#{params[agency_id]}/foster/#{application.id}")
    else
      flash[:notice] = application.errors.full_messages
      redirect_to ("/agency/#{params[agency_id]}/foster/#{application.id}")
    end
  end

  def status
    application = FosterApplication.find(params[:foster])
    if application.update(contacted: params[:contacted], interviewed: params[:interviewed],approved: params[:approved],accepted: params[:accepted])
      redirect_to ("/agency/#{params[agency_id]}/foster/#{application.id}")
    end
  end

  def foster
    session[:return_to] ||= request.referer
    animal = Animal.find(params[:animal_id])
    animal.adopted = false
    animal.fostered = true
    animal.save
    redirect_to session.delete(:return_to)
  end

  def destroy
    application = FosterApplication.find(params[:foster])
    application.destroy
    redirect_to "/agency/#{current_user.id}/foster"
  end
end
