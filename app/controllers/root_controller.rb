class RootController < ApplicationController
  include RootHelper

  def new
    #put enrollment of new users here
  end

  def login
    # render the login page
    redirect_to welcome_url and return if current_user
    token = cookies.signed[:snap_login]
    if token.present?
      @snap_login = SnapLogin.find_by_token(token)
    end
    if @snap_login.nil?
      @snap_login = SnapLogin.new
      @snap_login.token = UUIDTools::UUID.random_create.to_s
      enroll_url = snap_login_url(@snap_login)
      if enroll_url.include?('localhost')
        enroll_url = request.protocol + local_ip + ':' + request.port.to_s + snap_login_path(@snap_login)
      end
      @snap_login.url = enroll_url
      @snap_login.save
      cookies.signed[:snap_login] = @snap_login.token
    end
    @user_session = UserSession.new
  end

  def index
    # redirect_to welcome_url and return if current_user
    # token = cookies.signed[:snap_login]
    # if token.present?
    #   @snap_login = SnapLogin.find_by_token(token)
    # end
    # if @snap_login.nil?
    #   @snap_login = SnapLogin.new
    #   @snap_login.token = UUIDTools::UUID.random_create.to_s
    #   @snap_login.save
    #   cookies.signed[:snap_login] = @snap_login.token
    # end
    # if @snap_login && @snap_login.email.present?
    #   @user_session = UserSession.create(User.find_by_email(@snap_login.email), true)
    #   @snap_login.destroy
    #   cookies.delete :snap_login
    #   redirect_to welcome_url
    # else
    #   @user_session = UserSession.new
    # end
  end

  def snap_login
    token = cookies.signed[:snap_login]
    snap_login = token.present? && SnapLogin.find_by_token(token)
    cookies.delete :snap_login
    if snap_login
      snap_login.destroy
      if snap_login.snapped
        device = Device.find_by_public_key snap_login.public_key
        if device && device.user
          UserSession.create(device.user, true)
          redirect_to welcome_url
          return
        end
      end
    end
    redirect_to login_path
  end

  def welcome
    head 404 unless current_user
    token = cookies.signed[:snap_login]
    if token.present?
      @snap_login = SnapLogin.find_by_token(token)
    end
    if @snap_login.nil?
      @snap_login = SnapLogin.new
      @snap_login.token = UUIDTools::UUID.random_create.to_s
      enroll_url = snap_login_url(@snap_login)
      if enroll_url.include?('localhost')
        enroll_url = request.protocol + local_ip + ':' + request.port.to_s + snap_login_path(@snap_login)
      end

      @snap_login.url = enroll_url
      @snap_login.save
      cookies.signed[:snap_login] = @snap_login.token
    end
  end

end
