class RegistrationsController < Devise::RegistrationsController
  before_action :set_user, only: [:show, :update, :edit]
  before_action :set_groups, only: [:show, :update, :edit]

  def sign_up
   redirect_to root_path
  end

  def show
   
  end

  def edit

  end

  def update
    
    respond_to do |format|
      if @user.update_attributes!(account_update_params)
        format.html { redirect_to(@user, :notice => 'User was successfully updated.') }
        format.json { respond_with_bip(@user) }
      else
        format.html { render :action => "edit" }
        format.json { respond_with_bip(@user)}
      end
    end
  end

private

  def account_update_params
    params.require(:user).permit(:first_name, :last_name,  :email, :roles, :slack_url, :password, :password_confirmation, :current_password)
  end

  def set_user
    @user = current_user
  end

  def set_groups
    @group = current_user.groups[0]
  end
end