class FavoriteController < ApplicationController
  def create
    return redirect_to '/404.html' unless request.xhr?
    post = Post.find(params[:post_id])
    Favorite.create(post_id: post.id, user_id: current_user.id)
  end
end