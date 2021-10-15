class Student::AcountsController < ApplicationController

    def new
        @student = StudentMember.new
    end
    
    def create
        @student = StudentMember.new(student_params)
        if @student.save
            redirect_to "#", notice: "登録しました"
            #そのままログインする
        else
            render "new"
        end
    end

    private

        def student_params
            params.permit(:family_name, :given_name, :family_name_kana, :given_name_kana, :gender, :birthday,
            :school_type, :school_year, :password)
        end

end
