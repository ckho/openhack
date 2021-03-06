class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :omniauthable,
         :rememberable

def self.from_omniauth(auth)
  where(provider: auth.provider, uid: auth.uid).first_or_create do |user|
    user.email = auth.info.email
    user.name = auth.info.name   # assuming the user model has a name
    user.image = auth.info.image # assuming the user model has an image
    # If you are using confirmable and the provider(s) you use validate emails, 
    # uncomment the line below to skip the confirmation emails.
    # user.skip_confirmation!
  end
end

  # def update_omniauth_credentials(oauth_data)
  #   self.omniauth_access_token = oauth_data.credentials.token
  #   self.omniauth_token_expires_at = oauth_data.credentials.expires_at
  #   self.omniauth_refresh_token = oauth_data.credentials.refresh_token
  # end
end
