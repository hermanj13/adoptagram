class AgencyController < ApplicationController
  def dashboard
    @agencyPosts = Post.where(agency_id: current_user.id).order(created_at: :ASC)
  end

  def show
    @agency = Agency.find(params[:agency_id])
    @agencyPosts = Post.where(agency_id: params[:agency_id]).order('created_at DESC')
    @dogsAvailable = Animal.where(agency_id: params[:agency_id]).where(species: "Dog").where(adopted: false).where(fostered: false).count
    @catsAvailable = Animal.where(agency_id: params[:agency_id]).where(species: "Cat").where(adopted: false).where(fostered: false).count
    @animalsFostered = Animal.where(agency_id: params[:agency_id]).where(fostered: true).count
    @animalsAdopted =Animal.where(agency_id: params[:agency_id]).where(adopted: true).count
  end

  def update
    contact = AgencyContact.new(agency_id: current_user.id, address1: params[:address1], address2: params[:address2], city: params[:city],
    state: params[:state], zip: params[:zip])
    if contact.save
      redirect_to("/agency/#{current_user.id}/dashboard")
    else
      puts contact.errors.full_messages
      redirect_to("/agency/#{current_user.id}/dashboard")
    end
  end

  def all
    @agencyAnimals = Animal.where(agency_id: current_user.id)
  end

  def destroy
    agency = Agency.find(params[:agency_id])
    agency.destroy
    redirect_to '/logout'
  end
end

#include a check for user_id is params[:agency]#
