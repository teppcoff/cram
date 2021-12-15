class Parent::PostsController < Parent::Base

    def index
      @posts = Post.all.order(created_at: "DESC").page(params[:page]).per(7)
    end

    def show
      @post = Post.find(params[:id])
    end

end
