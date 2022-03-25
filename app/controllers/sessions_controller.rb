class SessionsController < ApplicationController

    def create
        user = User.new(user_params)
            if user.save && user.authenticate(user_params[:password])
                token = encode_token({user_id: user.id})
                render json: {user: UserSerializer.new(user).serializable_hash, token: token}, status: :created
            else
                render json: {error: user.errors.full_messages.to_sentence}, status: :unprocessable_entity
            end
    end

    def user_params
        params.require(:user).permit(:email, :password)
    end



end
