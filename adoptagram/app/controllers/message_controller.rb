class MessageController < ApplicationController
  def agency_index
    @read_messages = Message.where(agency_id: current_user.id).where(agencyread: true)
    @unread_messages = Message.where(agency_id: current_user.id).where(agencyread: false)
  end

  def agency_show
    @message = Message.find(params[:message_id])
    @message.agencyread = true
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
    @read_messages = Message.where(user_id: current_user.id).where(userread: true)
    @unread_messages = Message.where(user_id: current_user.id).where(userread: false)

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
    @message.userread = true
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

  def mark_read
    session[:return_to] ||= request.referer
    message = Message.find(params[:message_id])
    if session[:type] == "agency"
      if message.agencyread == true
        message.agencyread = false
        message.save
      elsif message.agencyread == false
        message.agencyread = true
        message.save
      end
    elsif session[:type] == "user"
      if message.userread == true
        message.userread = false
        message.save
      elsif message.userread == false
        message.userread = true
        message.save
      end
    end
    redirect_to session.delete(:return_to)
  end
end
