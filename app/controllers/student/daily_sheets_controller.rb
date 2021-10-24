class Student::DailySheetsController < Student::Base

    def index
        @daily_sheets = current_student.daily_sheets.page(params[:page]).per(10)
    end
    
    def show
        @daily_sheet = DailySheet.find(params[:id])
        @textbooks = @daily_sheet.textbooks
    end


end
