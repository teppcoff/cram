class Staff::DailySheetsController < Staff::Base

    def new
        @daily_sheet = DailySheet.new
    end
    
    #textがshowで取得出来ない
    def create
        @daily_sheet = DailySheet.new(daily_sheet_params)
        if @daily_sheet.save
            redirect_to staff_daily_sheets_path, notice: "登録しました"
        else
            render "new"
        end
        @daily_sheet.create_notification_daily_sheet!(current_staff)
    end

    def index
        @daily_sheets = current_staff.daily_sheets
    end
    
    def show
        @daily_sheet = DailySheet.find(params[:id])
        @textbooks = @daily_sheet.textbooks
    end

    private

        def daily_sheet_params
            params.require(:daily_sheet).permit(:study_date, :period, :message, :information, :student_member_id, :staff_member_id, :subject_id, { textbook_ids: [] })
        end
        
end
