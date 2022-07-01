class UsersController < ApplicationController
    # def index
    #     @users = User.all
    #     render json: @users
    #     # render plain: "I'm in the index action!"
    # end

    def index
        if params.has_key?(:artist_id)
            @artworks = Artwork.where(artist_id: params[:id] )
        else
            @artworks = Artwork.all
        end

        render json: @artworks
    end


    #rendor returns the data in json format?
    def show
        @user = User.find(params[:id])
        render json: @user
    end
    
    def create 
        @user = User.new(user_params)           #creates a new user instance
            if @user.save                   
                redirect_to user_url(@user)        #if successfuly saved returns users profile
            else
                render json: @user.errors.full_messages, status: :unprocessable_entity   #returns error if perams arent unique
            end
        # render json: params
    end
       

    def update
        @user = User.find(params[:id])
        if @user.update(user_params)            #find user then use built in update method to make changes
            redirect_to user_url(@user)         #returns user link
        else
            render json: @user.errors.full_messages, status: :unprocessable_entity #if input is incorrect
        end
    end

    def destroy
        @user = User.find(params[:id])          # finds user via id
        @user.destroy                           #calls built in destory method
        redirect_to users_url                   #redirects to the rest of the users
    end


    #users params method to find the username out of user?
    #makes things eaiser by making another method instead of writing it out every time
    def user_params
        params.require(:user).permit(:username)        
    end
end