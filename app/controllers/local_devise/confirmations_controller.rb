class LocalDevise::ConfirmationsController < Devise::ConfirmationsController

  def create
    user_email = User.fetch_unconfirmed_email(resource_params[:username]) if resource_params[:username]
    unless user_email.blank?
      resource_params = {:email => user_email}
      self.resource = resource_class.send_confirmation_instructions(resource_params)
      if successfully_sent?(resource)
        flash[:notice] = t(:confirmation_email_sent, :scope => 'myinfo.devise.messages') if is_navigational_format?
      else
        flash[:error] = t(:unable_send_confirmation_email, :scope => 'myinfo.devise.messages') if is_navigational_format?
      end
    else
      flash[:notice] = t(:no_unconfirmed_email, :scope => 'myinfo.devise.messages') if is_navigational_format?
    end
    redirect_to dashboard_path
  end

  protected
  
  # The path used after confirmation.
  def after_confirmation_path_for(resource_name, resource)
    if Devise.allow_insecure_sign_in_after_confirmation
      after_sign_in_path_for(resource)
    else
      dashboard_path
    end
  end

end
