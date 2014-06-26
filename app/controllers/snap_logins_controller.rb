class SnapLoginsController < ApplicationController
  skip_before_action :verify_authenticity_token

  def update
    pk = params[:public_key]
    name = params[:device_name]
    sig = params[:signature]
    sl = SnapLogin.find_by_token!(params[:id])
    if sl && !sl.snapped && sl.verify_signature(sig, pk)
      sl.snapped = true
      sl.public_key = pk
      sl.device_name = name
      sl.save!
      # d = Device.new
      # d.name = name
      # d.public_key = pk
      # d.user = sl.user
      # d.save!
      # sl.email = sl.user.email
      # sl.save
      head 201
      return
    end
    head 404


    # @snap_login = SnapLogin.find_by_token(params[:id])
    # @snap_login.update(params.permit(:email))
    # redirect_to root_index_path
    # render json: {ok: 'yeah'}
  end

  def show
    @snap_login = SnapLogin.find_by_token!(params[:id])
    render json: {snapped:@snap_login.snapped}
  end

  def destroy
    @snap_login = SnapLogin.find_by_token!(params[:id])
    @snap_login.destroy
    head 200
  end

end
