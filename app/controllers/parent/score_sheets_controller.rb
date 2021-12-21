class Parent::ScoreSheetsController < Parent::Base

    def index
        # ページネーションのために子供の点数表を配列に入れている
        # 他に良い方法が見つからなかった
        # score_sheets = Array.new
        # students_of_current_parent.each { |student| score_sheets.push(student.score_sheets) }
        # score_sheets.flatten! 
        # @score_sheets = Kaminari.paginate_array(score_sheets).page(params[:page]).per(7)
        # students = current_parent.student_members
        score_sheets = current_parent.score_sheets
        # @score_sheets.order(created_at: "DESC").page(params[:page]).per(7)
        @score_sheets = score_sheets.page(params[:page]).per(7)
    end

    def show
        @score_sheet = ScoreSheet.find(params[:id])
        @scores = @score_sheet.scores
    end

end
