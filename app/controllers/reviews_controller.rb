class ReviewsController < ApplicationController

  before_action :find_review, only:[:show, :edit, :update]
  before_action :not_logged_in?
  def index
    #if it's nested and the id is valid
    if @game = Game.find_by_id(params[:game_id])
      @reviews = @game.reviews
    else
      @reviews = Review.all
    end
  end

  def new
    if @game = Game.find_by_id(params[:game_id])
      @review = @game.reviews.build
    else
      @review = Review.new
    end
  end

  def create
    @review = current_user.reviews.build(review_params)
    if @review.save
      redirect_to review_path(@review)
    else
      render :new
    end
  end

  def show
  end

  def edit
  end

  def update
    if @review.update(review_params)
      redirect_to review_path(@review)
    else
      render :edit
    end
  end

  def destroy
    @review = Review.find_by_id(params[:id])
    @review.destroy
    redirect_to user_path(@review.user)
  end

  private

  def review_params
    params.require(:review).permit(:rating, :content, :game_id)
  end

  def find_review
    @review = Review.find_by_id(params[:id])
  end
end
