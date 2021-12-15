module SessionsHelper
    def log_in_as_parent(parent)
      session[:parent_member_id] = parent.id
    end
end