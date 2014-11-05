class API::V1::CandidatesController < ActionController::API
  include ActionController::HttpAuthentication::Token::ControllerMethods

  def index
    @candidates = Candidate.all
    render json: @candidates
  end

  def show
    @candidate = Candidate.find(params[:id])
    render json: @candidate
  end
end
