class Users::RegistrationsController < Devise::RegistrationsController
  def create
    build_resource(sign_up_params)
    if resource.save
      sign_in(resource_name, resource, store: false)
      render json: { message: 'User created successfully' }, status: :created
    else
      render json: { errors: resource.errors.full_messages }, status: :unprocessable_entity
    end
  end
  
end