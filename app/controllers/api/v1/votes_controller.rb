class API::V1::VotesController < ActionController::API
  before_filter :load_user, only: [:create]
  before_filter :restrict_access, only: [:create]

  def index
    @votes = Vote.all
    render json: @votes
  end

  def create
    @vote = Vote.new(vote_params)
    if @vote.save
      render json: @vote, status: :created
    else
      render json: { errors: @vote.errors }, status: :bad_request
    end

  end

  private

  def restrict_access
    unless @voter.token == params[:token]
      render nothing: true, status: :unauthorized
    end
  end

  def vote_params
    params.require(:vote).permit(:voter_id, :candidate_id)
  end

  def load_user
    @voter = Voter.find(params[:vote][:voter_id])
  end
end
