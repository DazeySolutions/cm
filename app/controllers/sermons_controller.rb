class SermonsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  load_and_authorize_resource 

  # GET /sermons
  # GET /sermons.json
  def index
    if current_user
        @sermons = Sermon.order("start ASC")
    else
        @sermons = Sermon.where("end >= ?", DateTime.now).order("start ASC")
    end
  end

  # GET /sermons/1
  # GET /sermons/1.json
  def show
  end

  # GET /sermons/new
  def new
  end

  # GET /sermons/1/edit
  def edit
  end

  # POST /sermons
  # POST /sermons.json
  def create
    @sermon = Sermon.new(sermon_params)
    @sermon.start = DateTime.parse(sermon_params[:start])
    @sermon.end = DateTime.parse(sermon_params[:end])
    respond_to do |format|
      if @sermon.save
        format.html { redirect_to @sermon, notice: 'Sermon was successfully created.' }
        format.json { render :show, status: :created, location: @sermon }
      else
        format.html { render :new }
        format.json { render json: @sermon.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sermons/1
  # PATCH/PUT /sermons/1.json
  def update
    if sermon_params[:image].blank?
       sermon_params[:image] = @sermon.image
    end
    if sermon_params[:start].blank?
       sermon_params[:start] = @sermon.start
    end
    if sermon_params[:end].blank?
       sermon_params[:end] = @sermon.end
    end
   respond_to do |format|
      if @sermon.update(sermon_params)
        format.html { redirect_to @sermon, notice: 'Sermon was successfully updated.' }
        format.json { render :show, status: :ok, location: @sermon }
      else
        format.html { render :edit }
        format.json { render json: @sermon.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sermons/1
  # DELETE /sermons/1.json
  def destroy
    @sermon.destroy
    respond_to do |format|
      format.html { redirect_to sermons_url, notice: 'Sermon was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Never trust parameters from the scary internet, only allow the white list through.
    def sermon_params
      params.require(:sermon).permit(:title, :description, :start, :end, :image).merge(user_id: current_user.id)
    end
end
