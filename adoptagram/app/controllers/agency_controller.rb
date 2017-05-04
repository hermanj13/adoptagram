class AgencyController < ApplicationController
  def dashboard
    @agencyPosts = Posts.where(agency_id: current_user.id)
  end

  def show
    @agencyPosts = Posts.where(agency_id: params[:agency_id])
  end

  def update
    # Decide on update information later and add here
  end

  def all
    @agencyAnimals = Animals.where(agency_id: current_user.id)
  end

  def destroy
    agency = Agency.find(params[:agency_id])
    agency.destroy
    redirect_to '/logout'
  end
end

#include a check for user_id is params[:agency]#
