class API::V1::VotersController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_filter :load_user, only: [:show, :update]
  before_filter :restrict_access_to_user, only: [:update, :show]

  def index
    @voters = Voter.all
    render json: @voters
  end

  def show
    # @voter = Voter.find(params[:id])
    render json: @voter
  end

  def create
    @voter = Voter.new(voter_params)
    if @voter.save
      render json: @voter.as_json(include_token: true), status: :created, location: api_v1_voter_path(@voter)
    else
      render json: { errors: @voter.errors }, status: :bad_request
    end
  end

  def update
    if @voter.update(voter_params)
      render json: @voter, status: :ok
    else
      render json: { errors: @voter.errors }, status: :bad_request
    end
  end

  private

  def load_user
    @voter = Voter.find(params[:id])
  end

  def restrict_access_to_user
    unless @voter.token == params[:token]
      render nothing: true, status: :unauthorized
    end
  end

  def voter_params
    params.require(:voter).permit(:name, :email, :party)
  end
end
