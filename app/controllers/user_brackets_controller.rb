class UserBracketsController < ApplicationController
  before_action :set_user_bracket, only: [:show, :update, :destroy]

  # GET /users/:user_id/brackets
  def index
    user_id = params[:user_id]
    user = User.find user_id
    render json: user.brackets, each_serializer: SimpleBracketSerializer
  end

  # GET /user_brackets/1
  # GET /user_brackets/1.json
  def show
  end

  # POST /users/:user_id/brackets
  def create
    user_id = params[:user_id]
    bracket_id = params[:bracket_id]
    user = User.find user_id

    UserBracket.create user_id: user_id, bracket_id: bracket_id unless user.brackets.any?{|b| b.id == bracket_id}
  end

  # PUT /users/:user_id/brackets
  def update
    user_id = params[:user_id]
    bracket_id = params[:bracket_id]
    user = User.find user_id

    UserBracket.create user_id: user_id, bracket_id: bracket_id unless user.brackets.any?{|b| b.id == bracket_id}
  end

  # DELETE /user_brackets/1
  # DELETE /user_brackets/1.json
  def destroy
    @user_bracket.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user_bracket
      @user_bracket = UserBracket.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_bracket_params
      params.fetch(:user_bracket, {})
    end
end
