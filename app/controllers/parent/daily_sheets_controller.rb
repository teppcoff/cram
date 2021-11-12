class Parent::DailySheetsController < Parent::Base

    def index
        @students = current_parent.student_members
        @daily_sheets = Array.new
        @students.each do |student|
            @daily_sheets.push(student)
        end
        @daily_sheets.flatten!
        @daily_sheets = Kaminari.paginate_array(@daily_sheets).page(params[:page]).per(10)
    end
    
    def show
        @daily_sheet = DailySheet.find(params[:id])
    end

end
