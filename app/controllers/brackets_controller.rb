class BracketsController < ApplicationController
  before_action :set_bracket, only: [:show, :edit, :update, :destroy]

  # GET /brackets
  # GET /brackets.json
  def index
    @brackets = Bracket.all
    render json: @brackets, each_serializer: SimpleBracketSerializer
  end

  # GET /brackets/1
  # GET /brackets/1.json
  def show
    render json: @bracket, serializer: CompleteBracketSerializer
  end

  # GET /brackets/new
  def new
    @bracket = Bracket.new
  end

  # GET /brackets/1/edit
  def edit
  end

  # POST /brackets
  # POST /brackets.json
  def create
    # Below will obviously need replaced
    user = User.find_by username: 'Sean'
    user = User.create username: 'Sean' unless user
    @bracket = Bracket.create name: params['bracketName'], creator_id: user.id
    competitors = []
    params['competitors'].each do |competitor|
      competitors << Competitor.create(name: competitor['name'])
    end

    matchups_in_round = competitors.length / 2
    created_matchups = 0
    number_of_rounds(competitors.length).times do |i|
      round = Round.create number: i, bracket_id: @bracket.id
      matchups_in_round.times do
        matchup = Matchup.create number: created_matchups, round_id: round.id, completed: false
        if i.zero?
          CompetitorMatchup.create matchup_id: matchup.id, competitor_id: competitors[created_matchups].id
          CompetitorMatchup.create matchup_id: matchup.id, competitor_id: competitors[created_matchups+1].id
          created_matchups += 2
        end
      end
      matchups_in_round /= 2
    end

    # respond_to do |format|
    #   if @bracket.save
    #     format.html { redirect_to @bracket, notice: 'Bracket was successfully created.' }
    #     format.json { render :show, status: :created, location: @bracket }
    #   else
    #     format.html { render :new }
    #     format.json { render json: @bracket.errors, status: :unprocessable_entity }
    #   end
    # end
  end

  def advance_round
    bracket_id = params[:id]
    bracket = Bracket.find bracket_id
    return if bracket.rounds.length - 1 == bracket.rounds_completed

    winners = bracket.rounds[bracket.rounds_completed].matchups.map do |matchup|
      matchup.competitor_matchups.max_by do |competitor_matchup|
        competitor_matchup.votes.length
      end
    end
    bracket.rounds[bracket.rounds_completed + 1].matchups.each_with_index do |matchup, i|
      CompetitorMatchup.create matchup_id: matchup.id, competitor_id: winners[2*i].competitor.id
      CompetitorMatchup.create matchup_id: matchup.id, competitor_id: winners[2*i + 1].competitor.id
    end
    bracket.rounds[bracket.rounds_completed].update completed: true

    render json: bracket, serializer: CompleteBracketSerializer
  end


  # PATCH/PUT /brackets/1
  # PATCH/PUT /brackets/1.json
  def update
    respond_to do |format|
      if @bracket.update(bracket_params)
        format.html { redirect_to @bracket, notice: 'Bracket was successfully updated.' }
        format.json { render :show, status: :ok, location: @bracket }
      else
        format.html { render :edit }
        format.json { render json: @bracket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /brackets/1
  # DELETE /brackets/1.json
  def destroy
    @bracket.destroy
    respond_to do |format|
      format.html { redirect_to brackets_url, notice: 'Bracket was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bracket
      @bracket = Bracket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bracket_params
      params.fetch(:bracket, {})
    end

    def number_of_rounds number_of_competitors
      case number_of_competitors
      when 16
        4
      when 8
        3
      when 4
        2
      when 2
        1
      end
    end
end
