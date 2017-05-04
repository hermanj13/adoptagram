class PostController < ApplicationController
  def create
    newPost = Post.new(animal_id: params[:animal_id], agency_id: current_user.id, description: params[:desc])
    if newPost.save
      redirect_to "/agency/#{current_user.id}/animal/#{params[:animal_id]}"
    else
      flash[:notice] = newPost.errors.full_messages
      redirect_to "/agency/#{current_user.id}/animal/#{params[:animal_id]}"
    end
  end

  def update
    session[:return_to] ||= request.referer
    post = Post.find(params[:post_id])
    post.desc = params[:desc]
    if post.save
      redirect_to "/agency/#{current_user.id}/animal/#{params[:animal_id]}"
    else
      redirect_to session.delete(:return_to)
    end
  end

  def destroy
    post = Post.find(params[:post_id])
    post.destroy
    redirect_to "/agency/#{current_user.id}/animal/#{params[:animal_id]}"
  end
end
