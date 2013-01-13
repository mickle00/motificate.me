module UsersHelper

  def logged_in_user? (user)
    current_user == user
  end
end
