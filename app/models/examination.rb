class Examination < ApplicationRecord

    validates :name, presence: true
    belongs_to :school
    has_many :score_sheets

    def calculate_total_average
        score_sheets = self.score_sheets
        total_points = 0
        score_sheets.each do |sheet|
            total_points += sheet.total_point
        end
        ( total_points / score_sheets.count ).round(1)
    end

    def calculate_highest_total_point
        score_sheets = self.score_sheets
        highest_total_point = 0
        score_sheets.each do |sheet|
            highest_total_point = sheet.total_point if sheet.total_point > highest_total_point
        end
        highest_total_point
    end

    def calculate_lowest_total_point
        score_sheets = self.score_sheets
        lowest_total_point = 500
        score_sheets.each do |sheet|
            lowest_total_point = sheet.total_point if sheet.total_point < lowest_total_point
        end
        lowest_total_point
    end

    def calculate_average_of(subject)
        score_sheets = self.score_sheets
        scores_list = Array.new
        score_sheets.each do |sheet| 
            sheet.scores.each do |score|
                scores_list.push(score.point) if score.subject_id == subject
            end
        end
        ( scores_list.sum / (scores_list.length) ).round(1)
    end

    def calculate_highest_point_of(subject)
        score_sheets = self.score_sheets
        highest_point = 0
        score_sheets.each do |sheet|
            sheet.scores.each do |score|
                if score.subject_id == subject && score.point > highest_point
                    highest_point = score.point
                end
            end
        end
        highest_point
    end

    def calculate_lowest_point_of(subject)
        score_sheets = self.score_sheets
        lowest_point = 100
        score_sheets.each do |sheet|
            sheet.scores.each do |score|
                if score.subject_id == subject && score.point < lowest_point
                    lowest_point = score.point
                end
            end
        end
        lowest_point
    end

    def subjects_of_examination
        subjects_list = Array.new
        self.score_sheets.each do |sheet|
            sheet.scores.each { |score| subjects_list << score.subject }
        end 
        subjects_list.uniq
    end

end