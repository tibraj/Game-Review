class GamesController < ApplicationController

  def index
    @games = Game.all 
  end

  def new
    @game = Game.new
    @game.build_genre
  end

  def create
    @game = Game.new(game_params)
    @game.user_id = session[:user_id]

    if @game.save
      redirect_to game_path(@game)
    else
      render :new
    end
  end

  def show
    if @game = Game.find_by_id(params[:id])
    else
      redirect_to games_path
    end
  end

  private

  def game_params
    params.require(:game).permit(:title, :genre_id, genre_attributes: [:name])
  end

end
