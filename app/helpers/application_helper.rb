module ApplicationHelper
    
    def current_user
        if session[:student_id]
            @current_user ||= Student.find(session[:student_id])
        else
            @current_user = nil
        end
    end

    def logged_in?
        !!current_user
    end

    def require_login
        unless logged_in?
            flash[:error] = 'Please login to view this page'
            redirect_to home_path
        end
    end

    def is_admin?
        !!current_user.is_admin
    end


end
