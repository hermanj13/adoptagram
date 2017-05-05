class CommentController < ApplicationController
  def create
    session[:return_to] ||= request.referer
    if session[:type] == "agency"
      newComment = Comment.new(post_id: params[:post_id], commenter_type: "Agency", commenter_id: current_user.id, comment: params[:comment])
    elsif session[:type] == "user"
      newComment = Comment.new(post_id: params[:post_id], commenter_type: "User", commenter_id: current_user.id, comment: params[:comment])
    end
    newComment.save
    redirect_to session.delete(:return_to)
  end
end
