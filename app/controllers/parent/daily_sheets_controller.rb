class Parent::DailySheetsController < Parent::Base

    def index
        @students = current_parent.student_members
    end
    
    def show
        @daily_sheet = DailySheet.find(params[:id])
        @textbooks = @daily_sheet.textbooks
    end

end
