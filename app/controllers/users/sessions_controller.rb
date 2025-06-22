class Users::SessionsController < Devise::SessionsController

  private

  def respond_with(resource, _opts = {})
    render json: { user: resource.email }, status: :ok
  end

  def respond_to_on_destroy
    if current_user
      sign_out(resource_name)
      head :no_content
    else
      render json: { error: 'Unauthorized' }, status: :unauthorized
    end
  end

end
