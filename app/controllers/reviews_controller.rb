class ReviewsController < ApplicationController
  skip_before_filter :require_login, only: [:index, :show]
  # before_action :set_review, only: [:show, :edit, :update, :destroy]

  # GET /reviews
  # GET /reviews.json
  def index
    @reviews = Review.order( 'name asc' )
  end

  # GET /reviews/1
  # GET /reviews/1.json
  def show
    @review = Review.where( :beer_id => params[:id], :user_id => current_user.id ).first
  end

  # GET /reviews/new
  def new
    beer_id = session[:beer_id]
    if !beer_id
      redirect_to beers_url
    end
    @beer = Beer.find(beer_id)

    @review = Review.new
  end

  # GET /reviews/1/edit
  def edit
    @review = Review.where( :beer_id => params[:id], :user_id => current_user.id ).first
    session[:beer_id] = params[:id]
    @beer = Beer.find(params[:id])

    if !@review
      redirect_to :controller => 'reviews', :action => 'new'
    end
  end

  # POST /reviews
  # POST /reviews.json
  def create
    @beer = Beer.find(session[:beer_id])
    respond_to do |format|
      insert = review_params
      insert[:beer_id] = session[:beer_id]
      insert[:user_id] = current_user.id
      session[:beer_id] = nil

      @review = Review.new(insert)

      if @review.save
        format.html { redirect_to @beer, notice: 'Review was successfully created.' }
        format.json { render :show, status: :created, location: @review }
      else
        format.html { render :new }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /reviews/1
  # PATCH/PUT /reviews/1.json
  def update
    @beer = Beer.find(session[:beer_id])
    @review = Review.where( :beer_id => session[:beer_id], :user_id => current_user.id ).first
    respond_to do |format|
      update = review_params
      update[:beer_id] = session[:beer_id]
      update[:user_id] = current_user.id
      session[:beer_id] = nil

      if @review.update(update)
        format.html { redirect_to @beer, notice: 'Review was successfully updated.' }
        format.json { render :show, status: :ok, location: @review }
      else
        format.html { render :edit }
        format.json { render json: @review.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /reviews/1
  # DELETE /reviews/1.json
  def destroy
    @review.destroy
    respond_to do |format|
      format.html { redirect_to reviews_url, notice: 'Review was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_review
      # @review = Review.find(params[:id])
      @review = Review.where( :beer_id => params[:id], :user_id => current_user.id ).first
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def review_params
      params.require(:review).permit(:sweet, :bitter, :sour, :smell, :alcohol, :comment)
    end
end
