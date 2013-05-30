#encoding: utf-8
class BlogController < ApplicationController
  def index
    @posts = Post.all  #모든 포스트(글)를 다 긁어옵시다!
  end

  def update
    @post = Post.find(params[:id]) #업데이트 할 글을 뽑아옵시다.
  end

  def write_process #새 글을 쓰는 액션(함수)입니다.
    post = Post.new #새 글을 하나 new 메소드로 만들고, post라는 변수에 저장합시다.

    #post.username, post.content에서 username, content는 db/migrate에 Post 모델에 정의했습니다.
    post.username = params[:username_from_view] #params로 받은 정보를 각자 맞춰서 잘 저장하고
    post.content = params[:content_from_view]
    post.save                                   #save 명령어로 저장!

    #You don't have to make view file(update_process.html.erb) in view directory by this redirction
    #이렇게 영어로 주석쓰면 0) 간지폭풍이거나, 1) Rails가 기본적으로 만든 주석같아보이거나....
    redirect_to :action => 'index' 
  end

  def update_process #write_process랑 크게 다르지 않습니다.
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
