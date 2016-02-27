class PostsController < ApplicationController
  before_action :logged_in_user, only: [:new, :index, :show, :statistics]
  before_action :set_post, only: [:show, :edit, :update, :destroy, :upvote, :downvote, :unvote]
  before_action :correct_user,   only: [:edit, :update]

  # GET /posts
  # GET /posts.json
  def index
    @posts = Post.all
  end

  # GET /posts/1
  # GET /posts/1.json
  def show
    @posts = Post.all
  end

  # GET /posts/new
  def new
    @post = Post.new
  end

  # GET /posts/1/edit
  def edit
  end

  # POST /posts
  # POST /posts.json
  def create
    @post = Post.new(post_params)
    @post.belongs = current_user.id

    respond_to do |format|
      if @post.save
        format.html { redirect_to posts_path, notice: 'Post was successfully created.' }
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
        format.html { redirect_to posts_path, notice: @post.title +  ' was successfully updated.' }
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
      format.html { redirect_to posts_path, notice: @post.title + ' was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  def upvote
    if current_user.liked? @post
      @post.unvote_by current_user
    else  
      @post.upvote_by current_user
    end
    redirect_to :back
  end

  def downvote
    if current_user.disliked? @post
      @post.unvote_by current_user
    else
      @post.downvote_by current_user
    end
    redirect_to :back
  end

  def unvote
    @post.unvote_by current_user
    redirect_to :back
  end

  def statistics
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_post
      @post = Post.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def post_params
      params.require(:post).permit(:title, :description, :market, :tags)
    end

    def correct_user
      redirect_to root_url unless (!current_user.nil?) and (current_user.id == @post.belongs or current_user.admin?)
    end

end