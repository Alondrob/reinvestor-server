class ApplicationController < ActionController::API
    before_action :require_login
    skip_before_action :require_login, only: [:home]
    
    def encode_token
        JWT.encode(payload, "alon214597&" )
    end

     def auth_header
        request.headers["Authorization"]
    end

    def decoded_token
        if auth_header 
           
            token = auth_header.split(" ")[1]
            begin
                JWT.decode(token, "alon214597&")
            rescue JWT::DecodeError
                nil 
            end
        end
    end

    def current_user
        if decoded_token
            user_id = decoded_token[0]["user_id"]
            @user = User.find_by(id: user_id)
        end
    end

    def logged_in?
        !!current_user
    end

    def authorized
        unless logged_in?
            render json: {message: "Please Log In"}, status: :unauthorized
        end
    end

end
