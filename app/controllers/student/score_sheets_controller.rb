class Student::ScoreSheetsController < Student::Base

    def index
        @score_sheets = current_student.score_sheets.order(created_at: "DESC").page(params[:page]).per(7)
    end

    def new
        @score_sheet = ScoreSheet.new
        @score = @score_sheet.scores.build
    end

    def create
        @score_sheet = ScoreSheet.new(score_sheet_params)
        if @score_sheet.save
            redirect_to student_score_sheets_path, notice: "登録しました"
        else
            render "new"
        end
    end

    def show
        @score_sheet = ScoreSheet.find(params[:id])
        @scores = @score_sheet.scores
    end

    def edit
        @score_sheet = ScoreSheet.find(params[:id])
    end

    def update
        @score_sheet = ScoreSheet.find(params[:id])
        if @score_sheet.update(score_sheet_params)
            redirect_to student_score_sheet_path(@score_sheet.id), notice: "シートを更新しました"
        else
            render "edit"
        end
    end

    def destroy
        @score_sheet = ScoreSheet.find(params[:id])
        @score_sheet.destroy
        redirect_to student_score_sheets_path, notice: "シートを削除しました"
    end

    private

        def score_sheet_params
            params.require(:score_sheet).permit(:student_member_id, :staff_member_id, :examination_id,
            scores_attributes: [ :subject_id, :point, :_destroy ])
        end
end
