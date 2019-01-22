class RegistrationsController < Devise::RegistrationsController
  before_action :set_user, only: [:show, :update, :edit]
  before_action :set_user_groups, only: [:show, :update, :edit]
  before_action :set_groups, only: [:show, :update, :edit]

  def sign_up
   redirect_to root_path
  end

  def show
    @groups = current_user.groups
  end

  def update
    respond_to do |format|
      if @user.update_attributes!(account_update_params)
        format.html { redirect_to(user_registration_path, :notice => 'User was successfully updated.') }
        format.json { respond_with_bip(@user) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@user)}
      end
    end
  end

private

  def account_update_params
    params.require(:user).permit(:first_name, :last_name,  :email, :roles, :slack_url, :password)
  end

  def set_user
    @user = current_user
  end

  def set_user_groups
    @groups = current_user.groups
  end

  def set_groups
    @group = @groups[0]
  end
end