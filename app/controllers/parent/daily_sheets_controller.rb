class Parent::DailySheetsController < Parent::Base

    def index
        notifications = current_parent.passive_notifications
        students = current_parent.student_members
        daily_sheets = Array.new
        students.each { |student| daily_sheets.push(student.daily_sheets) }
        daily_sheets.flatten! 
        @daily_sheets = Kaminari.paginate_array(daily_sheets).page(params[:page]).per(10)
        notifications.each { |n| n.update(checked: true) }
    end
    
    def show
        @daily_sheet = DailySheet.find(params[:id])
    end

end
