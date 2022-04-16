class UsersController < ApplicationController


    def index
        users = User.all
        render json: users
    end

    def create
        user = User.create(user_params)
         binding.pry
        if user.save && user.authenticate(user_params[:password])
            binding.pry
            token = encode_token({user_id: user.id})
            render json: { user: UserSerializer.new(user).serializable_hash, token: token}, status: :created
        else
            render json: {error: user.errors.full_messages.to_sentence}, status: :unprocessable_entity
        end

    end

    private 

    def user_params
        params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
    end
end
