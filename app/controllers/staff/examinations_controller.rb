class Staff::ExaminationsController < Staff::Base
    
    def show
        @examination = Examination.find(params[:id])
        @subjects = @examination.subjects_of_examination
    end

end
