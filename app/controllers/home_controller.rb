class HomeController < ApplicationController
  def index
  	@post = Post.where(famille_id: 6).last	
  	@post_actualite = Post.where(famille_id: 2).last
  	@post_divers = Post.where(famille_id: 4).last
  	@post_politique = Post.where(["created_at > ? and famille_id = ?" , (Time.now - 1.week), 6])
  	@post_sport = Post.where(["created_at > ? and famille_id = ?" , (Time.now - 1.week), 1])
  end

  def reference
    @post = Post.where(id: params[:id])
  end
end
