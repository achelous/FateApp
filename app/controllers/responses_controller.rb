class ResponsesController < ApplicationController

  before_filter :load_response, :only => [:show, :edit, :update, :destroy]

  def index
    @responses = Response.find(:all)
  end

  def show
  end

  def new
    @response = Response.new
  end

  def create
    post = Post.find(params[:post_id])
    post.responses << Response.new(params[:resp])
    redirect_to post_path(post)
    rescue ActiveRecord::RecordInvalid
      flash[:error] = "Invalid Input"
      render :action => 'new'
  end

  def edit
  end
  
  def update
  end

  def destroy
    @response.destroy
    flash[:notice] = "Response deleted!"
    redirect_to :controller => :main
  end

  private

  def load_response
    @response = Response.find(params[:id])
    rescue ActiveRecord::RecordNotFound
    end
end
