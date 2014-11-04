class API::V1::CandidatesController < ActionController::API


  def index
    @candidates = Candidate.all
    render json: @candidates
  end

  def show
    @candidate = Candidate.find(params[:id])

    render json: @candidate
  end

  def create
    @candidate = Candidate.new(candidate_params)

    if @candidate.save
      render json: @candidate.as_json(include_token: true), status: :created, location: api/
    else
      render json: @candidate.errors, status: :unprocessable_entity
    end
  end

  def update
    @candidate = Candidate.find(params[:id])

    if @candidate.update(candidate_params)
      head :no_content
    else
      render json: @candidate.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @candidate = Candidate.find(params[:id])
    @candidate.destroy

    head :no_content
  end

  private

    def candidate_params
      params.require(:candidate).permit(:name, :party)
    end
end
