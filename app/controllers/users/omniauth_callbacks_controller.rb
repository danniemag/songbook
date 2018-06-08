# frozen_string_literal: true

class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController
  def google_oauth2
    callback_from :google_oauth2
  end

  def callback_from(provider)
    provider = provider.to_s
    data = request.env['omniauth.auth']

    @user = User.where(uid: data[:uid], provider: provider).first

    if @user.nil?
      @user = User.create(
          uid:      data[:uid],
          provider: provider,
          picture:  data[:info][:image],
          name:     data[:info][:name],
          email:    dummy_email(data),
          password: Devise.friendly_token[0, 20],
          token:    SecureRandom.hex(16),
          expires:  data[:credentials][:expires],
          expires_at:    data[:extra][:expires_at],
          # refresh_token: data[:extra][:token]
      )
      @user.save
    end

    @user

    if @user.persisted?
      sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
      set_flash_message(:info, :success, :kind => provider.capitalize) if is_navigational_format?
    else
      session["devise.#{provider}_data"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end
  # You should configure your model like this:
  # devise :omniauthable, omniauth_providers: [:twitter]

  # You should also create an action method in this controller like this:
  # def twitter
  # end

  # More info at:
  # https://github.com/plataformatec/devise#omniauth

  # GET|POST /resource/auth/twitter
  # def passthru
  #   super
  # end

  # GET|POST /users/auth/twitter/callback
  # def failure
  #   super
  # end

  # protected

  # The path used when OmniAuth fails
  # def after_omniauth_failure_path_for(scope)
  #   super(scope)
  # end
  # def callback_from(provider)
  #   provider = provider.to_s
  #
  #   @user = User.find_for_oauth(request.env['omniauth.auth'])
  #   @user.contact_email = request.env['omniauth.auth']['info']['email']
  #
  #   if @user.persisted?
  #     sign_in_and_redirect @user, :event => :authentication #this will throw if @user is not activated
  #     set_flash_message(:info, :success, :kind => provider.capitalize) if is_navigational_format?
  #   else
  #     session["devise.#{provider}_data"] = request.env["omniauth.auth"]
  #     redirect_to new_user_registration_url
  #   end
  # end
  private

  def dummy_email(auth)
    "#{auth.uid}-#{auth.provider}@example.com"
  end
end
