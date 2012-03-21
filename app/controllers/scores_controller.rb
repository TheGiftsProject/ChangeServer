class ScoresController < ApplicationController

  before_filter :init_facebook_api, :except => [:index, :new]


  def index

  end

  def new
    @settings = FACEBOOK
  end

  def create
    profile = @api.get_object "me"
    name = profile['name']
    facebook_id = profile['id']
    email = profile['email']

    user = User.new
    user.name = name
    user.facebook_id = facebook_id
    user.email = email
    user.save!

    score = Score.new
    score.score = params[:score]
    score.user = user
    score.save!

    render :nothing => true
  end

  def init_facebook_api
    oauth = Koala::Facebook::OAuth.new(FACEBOOK['app_id'], FACEBOOK['secret'])
    facebook_user = oauth.get_user_info_from_cookies(cookies)
    @api = Koala::Facebook::API.new facebook_user['access_token']
  end

end
