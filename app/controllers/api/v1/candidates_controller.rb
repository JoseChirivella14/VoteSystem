class API::V1::CandidatesController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  before_filter :load_candidate, only: [:show, :update]
  before_filter :restrict_access_to_user, only: [:update]


  def index
    @candidates = Candidate.all
    render json: @candidates
  end

  def show
    # @candidate = Candidate.find(params[:id])  

    render json: @candidate
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      render json: @candidate.as_json(include_token: true), status: :created, location: api_v1_candidate_path
    else
      render json: {errors: @candidate.errors}, status: :bad_request
    end
  end

  def update
    if @candidate.update(candidate_params)
      render json: @candidate, status: :ok
    else
      render json: {errors: @candidate.errors}, status: :bad_request
    end
  end


  private
  def load_user
    @candidate = Candidate.find(params[:id])
  end

  def restrict_access_to_user
    unless @person.token == params[:token]
      render nothing: true, status: unauthorized
    end
  end


  def candidate_params
    params.require(:candidate).permit(:name, :party)
  end
end
