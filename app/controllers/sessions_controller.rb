class SessionsController < ApplicationController
 
    def create 
        user = User.find_by(email: params[:email])
        user_password = params[:password]
       
        if user && user.authenticate(user_password)
            token = encode_token({user_id: user.id})
            # binding.pry
            render json: {user: user, token: token}
        else
            render json: {error: "User not found"}
        end
    end

    private
    def user_params
        params.require(:user).permit(:email, :password)
    end



end
