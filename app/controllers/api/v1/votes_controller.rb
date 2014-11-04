class VotesController < ApplicationController
  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all

    render json: @votes
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
    @vote = Vote.find(params[:id])

    render json: @vote
  end

  # POST /votes
  # POST /votes.json
  def create
    @vote = Vote.new(vote_params)

    if @vote.save
      render json: @vote, status: :created, location: @vote
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    @vote = Vote.find(params[:id])

    if @vote.update(vote_params)
      head :no_content
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote = Vote.find(params[:id])
    @vote.destroy

    head :no_content
  end

  private
    
    def vote_params
      params.require(:vote).permit(:voter_id, :candidate)
    end
end
