class Parent::DailySheetsController < Parent::Base

    def index
        # 未読のデイリーシートの通知を取得(お知らせ一覧ページのトップで確認可能)
        # ページネーションのために子供のデイリーシートを配列に入れている
        # 他に良い方法が見つからなかった
        notifications = current_parent.passive_notifications
        students = current_parent.student_members
        daily_sheets = Array.new
        students.each { |student| daily_sheets.push(student.daily_sheets) }
        daily_sheets.flatten! 
        @daily_sheets = Kaminari.paginate_array(daily_sheets).page(params[:page]).per(5)
        notifications.each { |n| n.update(checked: true) }
    end
    
    def show
        @daily_sheet = DailySheet.find(params[:id])
    end

end
