class VotesController < ApplicationController
  before_action :set_vote, only: [:show, :update, :destroy]

  # GET /votes
  # GET /votes.json
  def index
    @votes = Vote.all
  end

  # GET /votes/1
  # GET /votes/1.json
  def show
  end

  # POST /votes
  # POST /votes.json
  def create
    user_id = params[:userId]
    matchup_id = params[:matchupId]
    competitor_id = params[:competitorId]
    old_vote = Vote.joins(:competitor_matchup).where(competitor_matchups: {matchup_id: matchup_id}, votes: {user_id: user_id}).first
    return if old_vote.present? && old_vote.competitor.id == competitor_id

    old_vote.destroy if old_vote.present?
    comeptitor_matchup = CompetitorMatchup.find_by matchup_id: matchup_id, competitor_id: competitor_id
    vote = Vote.create user_id: user_id, competitor_matchup_id: comeptitor_matchup.id

    render json: vote.competitor_matchup.matchup.round.bracket, serializer: CompleteBracketSerializer
  end

  # PATCH/PUT /votes/1
  # PATCH/PUT /votes/1.json
  def update
    if @vote.update(vote_params)
      render :show, status: :ok, location: @vote
    else
      render json: @vote.errors, status: :unprocessable_entity
    end
  end

  # DELETE /votes/1
  # DELETE /votes/1.json
  def destroy
    @vote.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_vote
      @vote = Vote.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def vote_params
      params.fetch(:vote, {})
    end
end
