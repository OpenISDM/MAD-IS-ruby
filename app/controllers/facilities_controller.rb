class FacilitiesController < ApplicationController
  # GET /facilities
  # GET /facilities.json
  def index
    @facilities = Facility.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @facilities }
    end
  end

  # GET /facilities/1
  # GET /facilities/1.json
  def show
    id = params[:id]
    r = /[^0-9]+/
    
    if r =~ id  # if id contains non-digits
      showGroupForType id
    else
      @facility = Facility.find(id)

      respond_to do |format|
        format.html # show.html.erb
        format.json { render json: @facility }
      end
    end
  end

  def showGroupForType(id)
    @facilities = Facility.where("fac_type = ?", id)
    @type = id

    respond_to do |format|
      format.html { render action: "showGroupForType" }
      format.json { render json: @facilities}
    end
  end

  # GET /facilities/new
  # GET /facilities/new.json
  def new
    @facility = Facility.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @facility }
    end
  end

  # GET /facilities/1/edit
  def edit
    @facility = Facility.find(params[:id])
  end

  # POST /facilities
  # POST /facilities.json
  def create
    @facility = Facility.new(params[:facility])

    respond_to do |format|
      if @facility.save
        format.html { redirect_to @facility, notice: 'Facility was successfully created.' }
        format.json { render json: @facility, status: :created, location: @facility }
      else
        format.html { render action: "new" }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /facilities/1
  # PUT /facilities/1.json
  def update
    @facility = Facility.find(params[:id])

    respond_to do |format|
      if @facility.update_attributes(params[:facility])
        format.html { redirect_to @facility, notice: 'Facility was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @facility.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /facilities/1
  # DELETE /facilities/1.json
  def destroy
    @facility = Facility.find(params[:id])
    @facility.destroy

    respond_to do |format|
      format.html { redirect_to facilities_url }
      format.json { head :no_content }
    end
  end

  def near
    @lat = params[:lat]
    @lon = params[:lon]
    @range = params[:range]

    @facilities = Facility.all
    respond_to do |format|
      format.html 
      format.json { render json: @facilities }
    end
  end
end
