class Parent::AcountsController < Parent::Base

    skip_before_action :login_required, only: [:new, :create]

    def new
        @parent = ParentMember.new
    end
    
    def create
        @parent = ParentMember.new(parent_params)
        if @parent.save
            redirect_to parent_login_path, notice: "登録しました"
            #そのままログインする
        else
            render "new"
        end
    end

    private

        def parent_params
            params.require(:parent_member).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :gender, :birthday,
            :email, :password, :password_confirmation)
        end
    
end
