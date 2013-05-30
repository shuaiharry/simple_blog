class BlogController < ApplicationController
  def index
    @posts = Post.all
  end

  def update
    @post = Post.find(params[:id])
  end

  def write_process
    post = Post.new
    post.username = params[:username_from_view]
    post.content = params[:content_from_view]
    post.save

    #You don't have to make view file(update_process.html.erb) in view directory by this redirction
    redirect_to :action => 'index' 
  end

  def update_process
    post = Post.find(params[:id])
    post.username = params[:username_from_view]
    post.content = params[:content_from_view]
    post.save

    #You don't have to make view file(update_process.html.erb) in view directory by this redirction
    redirect_to :action => 'index' 
  end

  def reply_process
    reply = Comment.new
    reply.post_id = params[:id]
    reply.username = params[:reply_username_from_view]
    reply.content = params[:reply_content_from_view]
    reply.save

    #You don't have to make view file(update_process.html.erb) in view directory by this redirction
    redirect_to :action => 'index' 
  end

  def delete_post
    post = Post.find(params[:id])
    post.destroy
    redirect_to :action => 'index' 
  end
end
