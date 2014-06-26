class DevicesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def enroll
    redirect_to login_path unless current_user
    token = cookies.signed[:snap_login]
    snap_login = token.present? && SnapLogin.find_by_token(token)
    cookies.delete :snap_login
    if snap_login
      snap_login.destroy
      if snap_login.snapped
        d = Device.new
        d.name = snap_login.device_name
        d.public_key = snap_login.public_key
        d.user = current_user
        d.save!
      end
    end
    redirect_to welcome_url
  end

  def destroy
    redirect_to login_path unless current_user
    device = Device.find(params[:id])
    if device
      device.destroy
    end
    redirect_to welcome_url
  end

end
