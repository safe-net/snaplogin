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
      @snap_login.save
      cookies.signed[:snap_login] = @snap_login.token
    end
    if @snap_login && @snap_login.email.present?
      @user_session = UserSession.create(User.find_by_email(@snap_login.email), true)
      @snap_login.destroy
      cookies.delete :snap_login
      redirect_to welcome_url
    else
      @user_session = UserSession.new
    end
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

  def welcome
    head 404 unless current_user
    token = cookies.signed[:snap_login]
    if token.present?
      @snap_login = SnapLogin.find_by_token(token)
    end
    if @snap_login.nil?
      @snap_login = SnapLogin.new
      @snap_login.token = UUIDTools::UUID.random_create.to_s
      enroll_url = enroll_url(token:@snap_login.token)
      same_origin_url = enroll_url
      if enroll_url.include?('localhost')
        enroll_url = request.protocol + local_ip + ':' + request.port.to_s + enroll_path(@snap_login)
      end

      @snap_login.url = enroll_url
      @snap_login.user = current_user
      @snap_login.save
      cookies.signed[:snap_login] = @snap_login.token
    elsif @snap_login.email.present?
      flash[:notice] = 'device enrolled'
      @snap_login.destroy
      cookies.delete :snap_login
    end

    @local_ip = local_ip
  end

end
