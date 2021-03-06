module Api
  class UsersController < ApplicationController
    protect_from_forgery with: :null_session
    def create

      #create local variables which store the user_id and token entered as in the parameters for the /users API call
      user_id = params[:user_id]
      user_token = params[:token]
      #authenticate the user_id and the user_token
      is_auth = User.authenticate_by_token(user_id, user_token)
      #if the user is authenticated, then the user will be able to view their campaigns
      if(is_auth)
        user = User.find_by_id(user_id)
        #retrieve all the campaigns that belong to the user
        users_campaigns = user.campaigns
        campaigns_hash_array = users_campaigns.collect{|campaign| {"campaign_id"=> campaign.id, "campaign_name"=> campaign.name, "campaign_description"=> campaign.description, "campaign_goal"=> campaign.goal_cents/100, "campaign_progress"=> campaign.amount_donated_cents/100}}
        render json: campaigns_hash_array
      else
        render json: token_auth_error, :status => 400
      end
    end

    def index
      render json: only_post_error, :status => 404
    end

    def new
      render json: only_post_error, :status => 404
    end

    def show
      render json: only_post_error, :status => 404
    end

    def edit
      render json: only_post_error, :status => 404
    end

    def update
      render json: only_post_error, :status => 404
    end

    def destroy
      render json: only_post_error, :status => 404
    end

    private
    def users_params
      params.require(:user).permit(:user_id, :token)
    end
  end
end
