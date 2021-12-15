class Student::DailySheetsController < Student::Base

    def index
        @daily_sheets = current_student.daily_sheets.order(study_date: "DESC").page(params[:page]).per(5)
    end
    
    def show
        @daily_sheet = DailySheet.find(params[:id])
    end

end
