class RegistrationsController < Devise::RegistrationsController
  before_filter :check_for_users
  layout 'admin'

  private

  def check_for_users
    unless User.exists?
      redirect_to new_user_registration_path and return
    end
    if User.exists?
      redirect_to user_session_path and return
    end
  end
end
