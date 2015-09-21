class PostsController < ApplicationController
  def index
    @posts = Post.all

    @posts.map.with_index { |post, i|
      if (i+1) % 5 == 0 && i != 0
        post.title=("CENSORED")
      end
    }
  end

  def show
  end

  def new
  end

  def edit
  end
end
