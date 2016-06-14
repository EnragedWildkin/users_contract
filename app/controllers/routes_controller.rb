class RoutesController < ActionController::Base

  def root
    root_p = case current_user&.role&.name
      when 'admin'
        users_path
      when 'registered'
        user_path(current_user)
      else
        log_in_path
      end

    redirect_to root_p
  end
end
