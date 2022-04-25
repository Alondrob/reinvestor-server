class UsersController < ApplicationController


    def index
        users = User.all
        render json: users
    end

    def create
        user = User.new(user_params)
        #  binding.pry
        if user.save && user.authenticate(user_params[:password])
            # binding.pry
            token = encode_token({user_id: user.id})
            render json: { user: UserSerializer.new(user).serializable_hash, token: token}, status: :created
        else
            render json: {error: user.errors.full_messages.to_sentence}, status: :unprocessable_entity
        end

    end

    # def login
    #     binding.pry
    #     user = User.find_by(params[:email])
    #     binding.pry
    #     if user && user.authenticate(params[:password])
    #         payload = {user_id: user.id}
    #         token = encode_token(payload)
    #         render json: {user: user, token: token}
    #     else
    #         render json: {error: "User not found"}
    #     end
    # end

    def token_authenticate
        token = request.headers["Authenticate"]
        user = User.find(decoded_token(token)["user_id"])
        render json: user
    end

    private 

    def user_params
        params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
    end
end
