class UsersController < ApplicationController


    # def create
    #     user = User.new(user_params)
    #         if user.save && user.authenticate(user_params[:password])
    #             token = encode_token({user_id: user.id})
    #             render json: {user: UserSerializer.new(user).serializable_hash, token: token}, status: :created
    #         else
    #             render json: {error: user.errors.full_messages.to_sentence}, status: :unprocessable_entity
    #         end
    # end

    def index
        users = User.all
        render json: users
    end

    def create
        user = User.create(user_params)
        #binsing.pry
        if user.valid?
            payload = {user_id: user.id}
            token = encode_token(payload)
            render json: {
                status: created,
                user: user,
                jwt: token
            }
        else
            render json: {
                status: 500,
                errorrs: user.errors.full_messages
            },
            status: "not_acceptable"
        end
    end

    private 

    def user_params
        params.require(:user).permit(:user_name, :email, :password, :password_confirmation)
    end
end
