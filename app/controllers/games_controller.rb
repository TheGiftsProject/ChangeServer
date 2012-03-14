class GamesController < ApplicationController

  def index

  end

  def new
    @game = Game.new
  end

  def create
    game = Game.new

    user_params = params[:user]
    facebook_id = user_params[:facebook_id]
    user = User.find_by_facebook_id facebook_id
    if user.nil?
      game.build_user user_params
    else
      game.user = user
    end

    game.save!
  end

end
