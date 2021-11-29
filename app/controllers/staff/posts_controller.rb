class Staff::PostsController < Staff::Base

    def index
        @posts = Post.all.page(params[:page]).per(10)
    end

    def new
        @post = Post.new
    end

    def create
        @post = Post.new(post_params)
        if @post.save
            redirect_to staff_posts_path
        else
            render "new"
        end
    end

    def show
        @post = Post.find(params[:id])
    end

    def edit
        @post = Post.find(params[:id])
    end

    def update
        @post = Post.find(params[:id])
        if @post.update(post_params)
            redirect_to staff_post_path(@post.id), notice: "投稿を更新しました"
        else
            render "edit"
        end
    end

    def destroy
        @post = Post.find(params[:id])
        @post.destroy
        redirect_to staff_posts_path, notice: "投稿を削除しました"
    end

    private

        def post_params
            params.require(:post).permit(:title, :content, :important, :staff_member_id)
        end

end
