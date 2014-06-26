class DevicesController < ApplicationController
  skip_before_action :verify_authenticity_token

  def enroll
    pk = params[:public_key]
    name = params[:device_name]
    sig = params[:signature]
    sl = SnapLogin.find_by_token(params[:token])
    if sl && sl.verify_signature(sig, pk)
      d = Device.new
      d.name = name
      d.public_key = pk
      d.user = sl.user
      d.save!
      sl.email = sl.user.email
      sl.save
      head 201
      return
    end
    head 404
  end

  def check_enrollment
    @snap_login = SnapLogin.find_by_token(params[:token])
    render json: {token: @snap_login.token, email: @snap_login.email}
  end
end
