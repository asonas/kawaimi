class FavoritesController < ApplicationController
  def create
    post     = Post.find(params[:post_id])
    favorite = Favorite.create(post_id: post.id, user_id: current_user.id)

    render :json => {
      :html => render_to_string(:partial => "posts/kawaimibutton", :as => :post, :object => post, :formats => :html, :handlers => :erb)
    }
  end
end
