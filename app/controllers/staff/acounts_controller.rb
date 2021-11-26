class Staff::AcountsController < Staff::Base

    skip_before_action :login_required, only: [:new, :create]

    def new
        @staff = StaffMember.new
    end
    
    def create
        @staff = StaffMember.new(staff_params)
        if @staff.save
            redirect_to staff_root_path, notice: "ようこそ、#{@staff.full_name}さん!"
        else
            render "new"
        end
    end

    def show
        @staff = StaffMember.find(params[:id])
    end

    def edit
        @staff = StaffMember.find(params[:id])
    end

    def update
        @staff = StaffMember.find(params[:id])
        if @staff.update(staff_params)
            redirect_to staff_path, notice: "ユーザー情報を更新しました"
        else
            render "edit"
        end
    end

    def destroy
        @staff = StaffMember.find(params[:id])
        @staff.destroy
        redirect_to staff_login_path, notice: "ユーザーを削除しました"
    end

            
    private

        def staff_params
            params.require(:staff_member).permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :gender, :birthday,
            :email, :employment_status, :password, :password_confirmation)
        end
    
end
