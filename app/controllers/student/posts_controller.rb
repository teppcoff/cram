class Student::PostsController < Student::Base

    def index
      @posts = Post.all.page(params[:page]).per(7)
    end

    def show
      @post = Post.find(params[:id])
    end

end
