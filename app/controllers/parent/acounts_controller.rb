class Parent::AcountsController < Parent::Base

    skip_before_action :login_required, only: [:new, :create]

    def new
        @parent = ParentMember.new
    end
    
    def create
        @parent = ParentMember.new(parent_params)
        if @parent.save
            redirect_to parent_root_path, notice: "登録しました"
            #そのままログインする
        else
            render "new"
        end
    end

    def show
        @parent = ParentMember.find(params[:id])
    end

    def edit
        @parent = ParentMember.find(params[:id])
    end

    def update
        @parent = ParentMember.find(params[:id])
        if @parent.update(parent_params)
            redirect_to parent_path, notice: "ユーザー情報を更新しました"
        else
            render "edit"
        end
    end

    def destroy
        @parent = ParentMember.find(params[:id])
        @parent.destroy
        redirect_to parent_login_path, notice: "ユーザーを削除しました"
    end

    private

        def parent_params
            params.require(:parent_member).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :gender, :birthday,
            :email, :password, :password_confirmation)
        end
    
end
