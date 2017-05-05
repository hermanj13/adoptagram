class AnimalController < ApplicationController
  def create
    newAnimal = Animal.new(agency_id: current_user.id, name: params[:name], breed: params[:breed], birthday: params[:birthday], gender: params[:gender],species: params[:species], weight: params[:weight])
    if newAnimal.save
      newPost = Post.new(animal_id: newAnimal.id, agency_id: current_user.id, description: params[:desc])
      if newPost.save
        redirect_to "/agency/#{params[:agency_id]}/animal/#{newAnimal.id}"
      else
        puts newPost.errors.full_messages
        redirect_to "/agency/#{params[:agency_id]}/dashboard"
      end
    else
      puts newAnimal.errors.full_messages
      redirect_to "/agency/#{params[:agency_id]}/dashboard"
    end
  end

  def agency
    @animal = Animal.find(params[:animal_id])
  end

  def shelter
    session[:return_to] ||= request.referer
    animal = Animal.find(params[:animal_id])
    animal.adopted = false
    animal.fostered = false
    animal.save
    redirect_to session.delete(:return_to)
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
    redirect_to "/agency/#{current_user.id}/animal/all"
  end
end
