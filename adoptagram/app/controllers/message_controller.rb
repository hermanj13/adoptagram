class MessageController < ApplicationController
  def agency_index
    @messages = Message.where(agency_id: current_user.id)
  end

  def agency_show
    @message = Message.find(params[:message_id])
    @message.read = true
    @message.save
  end

  def agency_reply
    newMessage = Message.new(agency_id: current_user.id, user_id: params[:user_id], anaimal_id: parmas[:animal_id], subject: params[:subject], message: params[:message])
    if newMessage.save
      redirect_to "/agency/#{current_user.id}/message"
    else
      flash[:notice] = newMessage.errors.full_messages
      redirect_to "/agency/#{current_user.id}/message/#{params[:message_id]}"
    end
  end

  def user_index
    @messages = Message.where(user_id: current_user.id)
  end

  def user_create
    session[:return_to] ||= request.referer
    newMessage = Message.new(agency_id: params[:agency_id], user_id: current_user.id, anaimal_id: parmas[:animal_id], subject: params[:subject], message: params[:message])
    if newMessage.save
      redirect_to session.delete(:return_to)
    else
      flash[:notice] = newMessage.errors.full_messages
      redirect_to session.delete(:return_to)
    end
  end

  def user_show
    @message = Message.find(params[:message_id])
    @message.read = true
    @message.save
  end

  def user_reply
    newMessage = Message.new(agency_id: params[:agency_id], user_id: current_user.id, anaimal_id: parmas[:animal_id], subject: params[:subject], message: params[:message])
    if newMessage.save
      redirect_to "/user/#{current_user.id}/message"
    else
      flash[:notice] = newMessage.errors.full_messages
      redirect_to "/user/#{current_user.id}/message/#{params[:message_id]}"
    end
  end
end
