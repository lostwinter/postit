class PostsController < ApplicationController
  before_action :set_post, only: [:show, :edit, :update]
  
  def index
    @posts = Post.all
  end
  
  def show
    @comment = Comment.new
  end #instance var set above
  
  def new
    @post = Post.new
  end
  
  def create
    @post = Post.new(post_params)
    @post.creator = User.first # change once we have authentication
    
    if @post.save
      flash[:notice] = "Your post was created"
      redirect_to posts_path
    else
      render :new
    end
  end
  
  def edit; end #instance var set above
  
  def update #instance var set above
    if @post.update(post_params)
      flash[:notice] = "Your post was updated"
      redirect_to posts_path
    else
      render :edit
    end
  end
  
  private
  def post_params
    params.require(:post).permit(:title, :url, :description)
  end
  
  def set_post
    @post = Post.find(params[:id])
  end
end
