class Parent::ScoreSheetsController < Parent::Base

    def index
        # ページネーションのために子供の点数表を配列に入れている(他に良い方法が見つからなかった)
        students = current_parent.student_members
        score_sheets = Array.new
        students.each { |student| score_sheets.push(student.score_sheets) }
        score_sheets.flatten! 
        @score_sheets = Kaminari.paginate_array(score_sheets).page(params[:page]).per(10)
    end

    def show
        @score_sheet = ScoreSheet.find(params[:id])
        @scores = @score_sheet.scores
    end

end
