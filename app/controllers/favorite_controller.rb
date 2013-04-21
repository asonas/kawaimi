class FavoriteController < ApplicationController
  def create
    post = Post.find(params[:post_id])
    Favorite.create(post_id: post.id, user_id: current_user.id)
  end
end