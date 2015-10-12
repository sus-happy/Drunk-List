class CountersController < ApplicationController
  before_action :set_beer, only: [:edit]

  # GET /counters/1/edit
  def edit
    @counter = Counter.new( { :beer_id => params['id'], :user_id => current_user.id } )

    respond_to do |format|
      if @counter.save
        format.html { redirect_to @beer, notice: 'Counter was successfully created.' }
        format.json { render :show, status: :created, location: @beer }
      else
        format.html { render :new }
        format.json { render json: @beer.errors, status: :unprocessable_entity }
      end
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_beer
      @beer = Beer.find(params[:id])
    end
end
