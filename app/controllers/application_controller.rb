class ApplicationController < ActionController::Base
    
    layout :set_layout

    private 
        def set_layout
            if params[:controller].match(%r{\A(parent|student|staff)/})
                Regexp.last_match[1]
            else
                "top"
            end
        end
end
