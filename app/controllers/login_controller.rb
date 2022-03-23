# frozen_string_literal: true

class LoginController < ApplicationController
  before_action :redirect_logged_user

  def new
    @login_form = LoginForm.new
  end

  def create
    @login_form = LoginForm.new(login_params)

    log_in = LogIn.new @login_form

    log_in.on(:success) do
      redirect_to check_inbox_path
    end

    log_in.on(:error) do
      render :new
    end

    log_in.call
  end

  def check_inbox
  end

  def verify_email
    verify_email = VerifyEmail.new(signed_url: request.original_url,
                                   code: params[:code], email: params[:email])

    verify_email.on(:success) do |user|
      SimpleAuth::Session.create(scope: "user", session:, record: user)

      redirect_to return_to(root_path)
    end

    verify_email.on(:error) do
      redirect_to login_path,
                  alert: "Your login link is not valid. Please try again."
    end

    verify_email.call
  end

  private def login_params
    params.require(:login_form).permit(:email)
  end
end
