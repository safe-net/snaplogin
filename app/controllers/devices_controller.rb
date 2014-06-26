class DevicesController < ApplicationController
  def enroll
    if current_user
      pk = params[:public_key]
      name = params[:device_name]
      sig = params[:signature]
      sl = SnapLogin.find_by_token(params[:token])
      if sl && sl.verify_signature(sig, pk)
        d = Device.new
        d.name = name
        d.public_key = pk
        d.user = current_user
        d.save!
        sl.email = current_user.email
        sl.save
        head 201
        return
      end
    end
    head 404
  end

  def check_enrollment
    @snap_login = SnapLogin.find_by_token(params[:token])
    render json: {token: @snap_login.token, email: @snap_login.email}
  end
end
