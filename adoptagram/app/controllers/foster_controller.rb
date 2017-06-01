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
    @application = FosterApplication.find(params[:foster_id])
    @messages = Message.where(animal_id: @application.animal.id)
  end

  def update
    application = FosterApplication.find(params[:foster_id])
    if application.update(comments: params[:comments])
      redirect_to ("/agency/#{current_user.id}/foster/#{application.id}")
    else
      flash[:notice] = application.errors.full_messages
      redirect_to ("/agency/#{current_user.id}/foster/#{application.id}")
    end
  end

  def status
    application = FosterApplication.find(params[:foster_id])
    if params[:contacted]
      application.contacted = !application.contacted
    elsif params[:interviewed]
      application.interviewed = !application.interviewed
    elsif params[:approved]
      application.approved = !application.approved
    elsif params[:accepted]
      application.accepted = !application.accepted
    end
    application.save
    redirect_to ("/agency/#{current_user.id}/foster/#{application.id}")
  end

  def foster
    session[:return_to] ||= request.referer
    animal = Animal.find(params[:animal_id])
    if !animal.adopted
      animal.fostered = !animal.fostered
    else
      flash[:adopted_notice] = "Animal is already adopted"
    end
    animal.save
    redirect_to session.delete(:return_to)
  end

  def destroy
    application = FosterApplication.find(params[:foster_id])
    application.destroy
    redirect_to "/agency/#{current_user.id}/foster"
  end
end
