class PosServersController < ApplicationController
  # GET /pos_servers
  # GET /pos_servers.json
  def index
    @pos_servers = PosServer.all

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @pos_servers }
    end
  end

  # GET /pos_servers/1
  # GET /pos_servers/1.json
  def show
    @pos_server = PosServer.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @pos_server }
    end
  end

  # GET /pos_servers/new
  # GET /pos_servers/new.json
  def new
    @pos_server = PosServer.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @pos_server }
    end
  end

  # GET /pos_servers/1/edit
  def edit
    @pos_server = PosServer.find(params[:id])
  end

  # POST /pos_servers
  # POST /pos_servers.json
  def create
    @pos_server = PosServer.new(params[:pos_server])

    respond_to do |format|
      if @pos_server.save
        format.html { redirect_to @pos_server, notice: 'Pos server was successfully created.' }
        format.json { render json: @pos_server, status: :created, location: @pos_server }
      else
        format.html { render action: "new" }
        format.json { render json: @pos_server.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /pos_servers/1
  # PUT /pos_servers/1.json
  def update
    @pos_server = PosServer.find(params[:id])

    respond_to do |format|
      if @pos_server.update_attributes(params[:pos_server])
        format.html { redirect_to @pos_server, notice: 'Pos server was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @pos_server.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /pos_servers/1
  # DELETE /pos_servers/1.json
  def destroy
    @pos_server = PosServer.find(params[:id])
    @pos_server.destroy

    respond_to do |format|
      format.html { redirect_to pos_servers_url }
      format.json { head :no_content }
    end
  end
end
