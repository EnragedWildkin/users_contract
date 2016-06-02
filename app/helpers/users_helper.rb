module UsersHelper
  def edit_page?
    params[:controller] == "users" && params[:action] == "edit"
  end

  def sign_up_page?
    params[:controller] == "users" && params[:action] == "new"
  end
end
