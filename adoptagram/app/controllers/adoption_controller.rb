class AdoptionController < ApplicationController
  def index
    @applications = AdoptionApplication.where(agency_id: params[:agency_id])
  end

  def create
    newApplication = AdoptionApplication.new(agency_id: params[:agency_id], anaimal_id: params[:animal_id], user_id: current_user.id)
    if newApplication.save
      redirect_to "/animal/#{params[:animal_id]}"
    else
      flash[:notice] = newApplication.errors.full_messages
      redirect_to "/animal/#{params[:animal_id]}"
    end
  end

  def show
    @application = AdoptionApplication.find(params[:adoption_id])
    @messages = Message.where(animal_id: @application.animal.id)
  end

  def update
    application = AdoptionApplication.find(params[:adoption_id])
    if application.update(comments: params[:comments])
      redirect_to ("/agency/#{current_user.id}/adoption/#{application.id}")
    else
      flash[:notice] = application.errors.full_messages
      redirect_to ("/agency/#{current_user.id}/adoption/#{application.id}")
    end
  end

  def status
    application = AdoptionApplication.find(params[:adoption_id])
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
    redirect_to ("/agency/#{current_user.id}/adoption/#{application.id}")
  end

  def adopt
    session[:return_to] ||= request.referer
    animal = Animal.find(params[:animal_id])
    animal.fostered = false
    animal.adopted = !animal.adopted
    animal.save
    redirect_to session.delete(:return_to)
  end

  def destroy
    application = AdoptionApplication.find(params[:adoption_id])
    application.destroy
    redirect_to "/agency/#{current_user.id}/adoption"
  end
end


#current user is agency and id check#
