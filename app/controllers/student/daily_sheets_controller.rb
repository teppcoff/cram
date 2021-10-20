class Student::DailySheetsController < Student::Base

    def index
        @daily_sheets = current_student.daily_sheets
    end
    
    def show
        @daily_sheet = DailySheet.find(params[:id])
        @textbooks = @daily_sheet.textbooks
    end


end
