class SessionsController < ApplicationController
    skip_before_action :require_login, only: [:login, :auto_login]


    # def create
    #     user = User.new(user_params)
    #         if user.save && user.authenticate(user_params[:password])
    #             token = encode_token({user_id: user.id})
    #             render json: {user: UserSerializer.new(user).serializable_hash, token: token}, status: :created
    #         else
    #             render json: {error: user.errors.full_messages.to_sentence}, status: :unprocessable_entity
    #         end
    # end

    def auto_login
        if current_user
            render json: {errorrs: "No user logged in."}
        else
            render json: {message: "You Are authorized"}
        end
    end

    def login
        user = User.find_by(email: params["email"]).try(:authenticate, params["password"])
        if user && user.authenticate(params[:password])
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {
                user: user, 
                jwt: token,
                succesess: "Welcome Back, #{user.user_name}!"
            }
        else
            render json: {
                faliure: "Log in failed: there was an error"
            }
        end
    end





    def user_params
        params.require(:user).permit(:email, :password)
    end



end
