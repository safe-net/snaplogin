require 'base64'

class SnapLogin < ActiveRecord::Base

  belongs_to :user

  def to_param
    token
  end

  def verify_signature(signature, public_key)
    pkey = OpenSSL::PKey::RSA.new(Base64.decode64(public_key))
    pkey.verify(OpenSSL::Digest::SHA256.new, signature, self.url)
  end
end
