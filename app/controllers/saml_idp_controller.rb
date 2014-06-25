class SamlIdpController < SamlIdp::IdpController
  def idp_authenticate(email, password) # not using params intentionally
    user = User.by_email(email).first
    user && user.valid_password?(password) ? user : nil
  end
  private :idp_authenticate

  def idp_make_saml_response(found_user) # not using params intentionally
    encode_response found_user
  end
  private :idp_make_saml_response
end
