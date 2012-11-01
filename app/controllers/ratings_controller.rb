class RatingsController < ApplicationController
  
  before_filter :get_facility
  # get the facility specified by routing

  def index
    @ratings = @facility.ratings

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @ratings }
    end
  end

  # GET /ratings/1
  # GET /ratings/1.json
  def show
    @rating = @facility.ratings.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rating }
    end
  end

  # GET /ratings/new
  # GET /ratings/new.json
  def new
    @facility = Facility.find(params[:facility_id])
    @rating = @facility.ratings.build
    #@rating = Rating.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rating }
    end
  end

  # GET /ratings/1/edit
  def edit
    @rating = @facility.ratings.find(params[:id])
  end

  # POST /ratings
  # POST /ratings.json
  def create
    @rating = @facility.ratings.build(params[:rating])
    #@rating = Rating.new(params[:rating])

    respond_to do |format|
      if @rating.save
        format.html { redirect_to facility_ratings_url(@facility), notice: 'Rating was successfully created.' }
        #format.html { redirect_to @rating, notice: 'Rating was successfully created.' }
        format.json { render json: @rating, status: :created, location: @rating }
      else
        format.html { render action: "new" }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /ratings/1
  # PUT /ratings/1.json
  def update
    @rating = @facility.ratings.find(params[:id])

    respond_to do |format|
      if @rating.update_attributes(params[:rating])
        format.html { redirect_to facility_ratings_url(@facility), notice: 'Rating was successfully updated.' }
        #format.html { redirect_to @rating, notice: 'Rating was successfully created.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rating.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /ratings/1
  # DELETE /ratings/1.json
  def destroy
    @rating = @facility.ratings.find(params[:id])
    @rating.destroy

    respond_to do |format|
      format.html { redirect_to facility_ratings_url(@facility) }
      format.json { head :no_content }
    end
  end
end

private
def get_facility
  @facility = Facility.find(params[:facility_id])
end
