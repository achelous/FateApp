class PostsController < ApplicationController

  before_filter :load_post, :only => [:show, :edit, :update, :destroy]
  append_before_filter :authenticate_key, :only => [:edit, :update, :destroy]

  def index
    @posts = Post.find(:all, :order => 'id DESC')
  end
 
  def show
  end

  def new
    @post = Post.new
  end

  def create
    post = Post.new(params[:post])
    post.save!
    redirect_to post_path(post.secret_key) #redirect to secret_key address
    rescue ActiveRecord::RecordInvalid
      render :action => 'new'
  end

  def edit
  end
  
  def update
  end
  
  def destroy
    @post.destroy
    flash[:notice] = "Post deleted!" 
    redirect_to posts
  end

  private

  def load_post
    call = params[:id]
    @key_flag = false
    if call.index('k') == 0 # If accessed by secret_key...
      @post = Post.find_by_secret_key(call)
      @key_flag = true # Set flag to grant access
    else
      @post = Post.find(call)
    end
    raise ActiveRecord::RecordNotFound if @post == nil
  end

  def authenticate_key
    redirect_to connections_url unless @key_flag
  end
end
 
