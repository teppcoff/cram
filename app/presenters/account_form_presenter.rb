class AccountFormPresenter < FormPresenter

    def full_name_block(name1, name2, label_text, options = {})
        markup(:div, class: "form-group") do |m|
            m << decorated_label(name1, label_text, options)
            m << text_field(name1, options)
            m << text_field(name2, options)
        end
    end

    def notes
        markup(:div, class:"notes") do |m|
            m.span "*", class: "mark"
            m.text "印のついた項目は入力必須です"
        end
    end

    def text_field_block(name, label_text, options = {})
        markup(:div, class: "form-group") do |m|
            m << decorated_label(name, label_text, options)
            m << text_field(name, options)
        end
    end

    def password_field_block(name, label_text, options = {})
        markup(:div, class: "form-group") do |m|
            m << decorated_label(name, label_text, options)
            m << password_field(name, options)
        end
    end

    def text_area_block(name, label_text, options = {})
        markup(:div, class: "form-group") do |m|
            m << decorated_label(name, label_text, options)
            m << text_area(name, options)
        end
    end

    def date_select_block(name, label_text, options = {})
        markup(:div, class: "form-group") do |m|
            m << decorated_label(name, label_text, options)
            m << date_select(name, options)
        end
    end

    private

        def decorated_label(name, label_text, options = {})
            label(name, label_text, class: options[:required] ? "required" : nil)
        end

end
