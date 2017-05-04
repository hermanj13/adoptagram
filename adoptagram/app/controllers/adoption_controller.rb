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
  end

  def update
    application = AdoptionApplication.find(params[:adoption_id])
    if application.update(comments: params[:comments])
      redirect_to ("/agency/#{params[agency_id]}/adoption/#{application.id}")
    else
      flash[:notice] = application.errors.full_messages
      redirect_to ("/agency/#{params[agency_id]}/adoption/#{application.id}")
    end
  end

  def status
    application = AdoptionApplication.find(params[:adoption_id])
    if application.update(contacted: params[:contacted], interviewed: params[:interviewed],approved: params[:approved],accepted: params[:accepted])
      redirect_to ("/agency/#{params[agency_id]}/adoption/#{application.id}")
    end
  end

  def destroy
    application = AdoptionApplication.find(params[:adoption_id])
    application.destroy
    redirect_to "/agency/#{current_user.id}/adoption"
  end
end


#current user is agency and id check#
