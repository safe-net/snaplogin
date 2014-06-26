class SamlIdpController < ApplicationController

  include SamlIdp::Controller

  protect_from_forgery
  before_filter :validate_saml_request, only: [:new, :create]

  def show
    render xml: SamlIdp.metadata.signed
  end

  def create
    unless params[:email].blank? && params[:password].blank?
      person = idp_authenticate(params[:email], params[:password])
      if person.nil?
        @saml_idp_fail_msg = 'Incorrect email or password.'
      else
        @saml_response = idp_make_saml_response(person)
        render :template => 'saml_idp/idp/saml_post', :layout => false
        return
      end
    end
    render :template => 'saml_idp/idp/new'
  end

  def new
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


    # if @snap_login && @snap_login.email.present?
    #   @snap_login.destroy
    #   cookies.delete :snap_login
    #   user = User.find_by_email(@snap_login.email)
    #   @saml_response = idp_make_saml_response(user)
    #   render :template => 'saml_idp/idp/saml_post', :layout => false
    #   return
    # else
    #   @user_session = UserSession.new
    # end
    render template: 'saml_idp/idp/new'
  end

  def snap
    token = cookies.signed[:snap_login]
    snap_login = token.present? && SnapLogin.find_by_token(token)
    cookies.delete :snap_login
    if snap_login
      snap_login.destroy
      if snap_login.snapped
        device = Device.find_by_public_key snap_login.public_key
        if device && device.user
          @saml_response = idp_make_saml_response(user)
          render :template => 'saml_idp/idp/saml_post', :layout => false
          return
        end
      end
    end
    redirect_to saml_auth_url
  end

  def idp_authenticate(email, password) # not using params intentionally
    user = User.find_by_email(email)
    user && user.password == password ? user : nil
  end
  private :idp_authenticate

  def idp_make_saml_response(found_user) # not using params intentionally
    encode_response found_user
  end
  private :idp_make_saml_response
end
