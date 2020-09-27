class PostsController < ApplicationController
before_action :authenticate_user!
before_action :set_post, only: [:show, :edit, :update, :destroy]
authorize_resource
  # GET /posts
  # GET /posts.json
  def index
    @posts = current_user.posts.all
    @category = Famille.all
    @user = User.all  
  end

   def detail
    @category = Famille.all
    @post = current_user.posts.where(famille_id: params[:id]).all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @category = Famille.all
    @user = User.all  
  end

  # GET /posts/new
  def new
    @post = Post.new
    @category = Famille.all
    @user = User.all
  end

  # GET /posts/1/edit
  def edit
    @category = Famille.all
    @user = User.all  
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.user_id = current_user.id
    respond_to do |format|
      
      if @post.save
        format.html { redirect_to @post, notice: 'Post was successfully created.' }
        format.json { render :show, status: :created, location: @post }
      else
        format.html { render :new }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /posts/1
  # PATCH/PUT /posts/1.json
  def update
    respond_to do |format|
      if @post.update(post_params)
        format.html { redirect_to @post, notice: 'Post was successfully updated.' }
        format.json { render :show, status: :ok, location: @post }
      else
        format.html { render :edit }
        format.json { render json: @post.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /posts/1
  # DELETE /posts/1.json
  def destroy
    @post.destroy
    respond_to do |format|
      format.html { redirect_to posts_url, notice: 'Post was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    def post_params
      params.require(:post).permit(:titre, :contenu, :user_id,:famille_id,:image,:clip,:thumbnail,:videoyoutube)
    end
end
