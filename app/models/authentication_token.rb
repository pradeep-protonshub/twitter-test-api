class AuthenticationToken < ApplicationRecord
  belongs_to :user

  has_secure_token :body

  TYPES = %w(ios android web).freeze

  enum device_type: TYPES

  def self.ios_tokens
    where(device_type: 'ios').pluck(:device_token)
  end

end
