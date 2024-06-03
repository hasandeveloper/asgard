class Users::RegistrationsController < Devise::RegistrationsController
  respond_to :json
  private
  def respond_with(resource, _opts = {})
    unless resource.errors.messages.empty?
      return register_failed resource.errors.full_messages.join(", "), 422
    end

    resource.persisted? ? register_success : register_failed("Registration failed", 500)
  end

  def register_success
    render json: { message: 'Signed up.' }, status: 200
  end

  def register_failed messages, status_code
    render json: { message:  messages }, status: status_code
  end
end