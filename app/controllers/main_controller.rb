class MainController < ApplicationController

  def homepage
    @posts = Post.find(:all, :limit => 3, :order => 'id DESC')
  end
 
end
