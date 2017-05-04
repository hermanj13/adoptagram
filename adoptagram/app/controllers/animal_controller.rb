class AnimalController < ApplicationController
  def create
    newAnimal = Animal.new(agency: current_user.id, name: params[:name], breed: params[:breed], birthday: params[:birthday], gender: params[:gender],species: params[:species], weight: params[:weight])
    if newAnimal.save
      newPost = Post.new(animal_id: newAnimal.id, agency_id: params[:agency_id], description: params[:desc])
      if newPost.save
        redirect_to "/agency/#{params[:agency_id]}/animal/#{newAnimal.id}}"
      else
        flash[:notice] = newPost.errors.full_messages
        redirect_to "/agency/#{params[:agency_id]}"
      end
    else
      flash[:notice] = newAnimal.errors.full_messages
      redirect_to "/agency/#{params[:agency_id]}"
    end
  end

  def agency
    @animal = Animal.find(params[:animal_id])
  end

  def update
    animal = Animal.find(params[:animal_id])
    if animal.update(name: params[:name], breed: params[:breed], birthday: params[:birthday], gender: params[:gender], weight: params[:weight])
      redirect_to "/agency/#{current_user.id}/animal/#{animal.id}}"
    else
      flash[:notice] = animal.errors.full_messages
      redirect_to "/agency/#{current_user.id}/animal/#{animal.id}}"
    end
  end

  def show
    @animal = Animal.find(params[:animal_id])
  end

  def destroy
    animal = Animal.find(params[:animal_id])
    animal.destroy
    redirect_to "/agency/current_user.id}/dashboard"
  end
end
