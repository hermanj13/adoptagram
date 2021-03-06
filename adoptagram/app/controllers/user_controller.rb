class UserController < ApplicationController
  def dashboard
    @posts = Post.all
  end

  def show
    if session[:type] == "user" && current_user.id.to_s == params[:user_id] || session[:type] == "agency" && AdoptionApplication.where(agency_id: current_user.id, user_id: params[:user_id]).first || session[:type] == "agency" && FosterApplication.where(agency_id: current_user.id, user_id: params[:user_id]).first
      @user = User.find(params[:user_id])
    end
  end

  def create_contact
    newContact = UserContact.new(user_id: current_user.id, first: params[:first], last: params[:last], occupation: params[:occupation], address1: params[:address1], address2: params[:address2], city: params[:city], state: params[:state], zip: params[:zip], phone: params[:phone], email: params[:email], best_contact: params[:best_contact])
    if newContact.save
      redirect_to "/user/#{current_user.id}"
    else
      flash[:notice] = newContact.errors.full_messages
      redirect_to "/user/#{current_user.id}"
    end
  end

  def create_family
    newFamily = FamilyInfo.new(user_id: current_user.id, adults: params[:adults], children: params[:children], home_type: params[:home_type], description: params[:description], landlord: params[:landlord], phone: params[:phone], allergies: params[:allergies], agreement: params[:agreement], time: params[:time])
    if newFamily.save
      redirect_to "/user/#{current_user.id}"
    else
      flash[:notice] = newFamily.errors.full_messages
      redirect_to "/user/#{current_user.id}"
    end
  end

  def create_pet
    newPet = OtherPet.new(user_id: current_user.id, number: params[:number], animal_type: params[:type], vacinated: params[:vacinated], fixed: params[:fixed], lost: params[:lost], discipline: params[:discipline])
    if newPet.save
      puts 'saved'
      redirect_to "/user/#{current_user.id}"
    else
      puts newPet.errors
      puts newPet
      puts 'fail'
      flash[:notice] = newPet.errors.full_messages
      redirect_to "/user/#{current_user.id}"
    end
  end

  def create_vet
    newVet = Vet.new(user_id: current_user.id, have: params[:have], name: params[:name], clinic: params[:clinic], phone: params[:phone])
    if newVet.save
      redirect_to "/user/#{current_user.id}"
    else
      flash[:notice] = newVet.errors.full_messages
      redirect_to "/user/#{current_user.id}"
    end
  end

  def update_contact
    updateContact = UserContact.find_by(user_id: current_user.id)
    if updateContact.update(first: params[:first], last: params[:last], occupation: params[:occupation], address1: params[:address1], address2: params[:address2], city: params[:city], state: params[:state], zip: params[:zip], phone: params[:phone], email: params[:email], best_contact: params[:best_contact])
      redirect_to "/user/#{current_user.id}"
    else
      flash[:notice] = updateContact.errors.full_messages
      redirect_to "/user/#{current_user.id}"
    end
  end

  def update_family
    updateFamily = FamilyInfo.find_by(user_id: current_user.id)
    if updateFamily.update(adults: params[:adults], children: params[:children], home_type: params[:home_type], description: params[:description], landlord: params[:landlord], phone: params[:phone], allergies: params[:allergies], agreement: params[:agreement], time: params[:time])
      redirect_to "/user/#{current_user.id}"
    else
      flash[:notice] = updateFamily.errors.full_messages
      redirect_to "/user/#{current_user.id}"
    end
  end

  def update_pet
    updatePet = OtherPet.find_by(user_id: current_user.id)
    if updatePet.update(number: params[:number], animal_type: params[:type], vacinated: params[:vacinated], fixed: params[:fixed], lost: params[:lost], discipline: params[:discipline])
      puts 'saved'
      redirect_to "/user/#{current_user.id}"
    else
      puts updatePet.errors.full_messages
      puts 'fail'
      flash[:notice] = updatePet.errors.full_messages
      redirect_to "/user/#{current_user.id}"
    end
  end

  def update_vet
    updateVet = Vet.find_by(user_id: current_user.id)
    if updateVet.update(have: params[:have], name: params[:name], clinic: params[:clinic], phone: params[:phone])
      redirect_to "/user/#{current_user.id}"
    else
      flash[:notice] = updateVet.errors.full_messages
      redirect_to "/user/#{current_user.id}"
    end
  end

  def destroy
    user = User.find(params[:user_id])
    user.destroy
    redirect_to '/logout'
  end
end
