class RatingAltsController < ApplicationController
  # GET /rating_alts
  # GET /rating_alts.json
  def index
    @rating_alts = Rating.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @rating_alts }
    end
  end

  # GET /rating_alts/1
  # GET /rating_alts/1.json
  def show
    @rating_alt = Rating.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @rating_alt }
    end
  end

  # GET /rating_alts/new
  # GET /rating_alts/new.json
  def new
    @rating_alt = Rating.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @rating_alt }
    end
  end

  # GET /rating_alts/1/edit
  def edit
    @rating_alt = Rating.find(params[:id])
  end

  # POST /rating_alts
  # POST /rating_alts.json
  def create
    @rating_alt = Rating.new(params[:rating_alt])

    respond_to do |format|
      if @rating_alt.save
        format.html { redirect_to @rating_alt, notice: 'Rating was successfully created.' }
        format.json { render json: @rating_alt, status: :created, location: @rating_alt }
      else
        format.html { render action: "new" }
        format.json { render json: @rating_alt.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /rating_alts/1
  # PUT /rating_alts/1.json
  def update
    @rating_alt = Rating.find(params[:id])

    respond_to do |format|
      if @rating_alt.update_attributes(params[:rating_alt])
        format.html { redirect_to @rating_alt, notice: 'Rating was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @rating_alt.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /rating_alts/1
  # DELETE /rating_alts/1.json
  def destroy
    @rating_alt = Rating.find(params[:id])
    @rating_alt.destroy

    respond_to do |format|
      format.html { redirect_to rating_alts_url }
      format.json { head :no_content }
    end
  end
end
