class Parent::AcountsController < Parent::Base

    skip_before_action :login_required, only: [:new, :create]

    def new
        @parent = ParentMember.new
    end
    
    def create
        parent = ParentMember.new(parent_params)
        if parent.save
            login_as_parent(parent)
            redirect_to parent_root_path, notice: "ようこそ、#{parent.full_name}さん!"
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
            redirect_to parent_path(current_parent.id), notice: "ユーザー情報を更新しました"
        else
            render "edit"
        end
    end

    def destroy
        @parent = ParentMember.find(params[:id])
        @parent.destroy
        if @parent.present?
            redirect_to parent_path, notice: "#{@parent.errors.messages[:base].join('。')}"
        else
            redirect_to parent_login_path, notice: "ユーザーを削除しました"
        end
    end

    private

        def parent_params
            params.require(:parent_member).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :gender, :birthday,
            :email, :password, :password_confirmation)
        end
    
end
