class EventsController < ApplicationController
  before_filter :authenticate_user!, :except => [:index]
  load_and_authorize_resource 

  # GET /events
  # GET /events.json
  def index
    if current_user
      @events = Event.order("start ASC")
    else
      @events = Event.where("end >= ?", DateTime.now).order("start ASC")
    end
  end

  # GET /events/1
  # GET /events/1.json
  def show
  end

  # GET /events/new
  def new
  end

  # GET /events/1/edit
  def edit
  end

  # POST /events
  # POST /events.json
  def create
    @event = Event.new(event_params)
    @event.start = DateTime.parse(event_params[:start])
    @event.end = DateTime.parse(event_params[:end])
    respond_to do |format|
      if @event.save
        format.html { redirect_to @event, notice: 'Event was successfully created.' }
        format.json { render :show, status: :created, location: @event }
      else
        format.html { render :new }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /events/1
  # PATCH/PUT /events/1.json
  def update
    if event_params[:image].blank?
       event_params[:image] = @event.image
    end
    if event_params[:start].blank?
       event_params[:start] = @event.start
    end
    if event_params[:end].blank?
       event_params[:end] = @event.end
    end
    respond_to do |format|
      if @event.update(event_params)
        format.html { redirect_to @event, notice: 'Event was successfully updated.' }
        format.json { render :show, status: :ok, location: @event }
      else
        format.html { render :edit }
        format.json { render json: @event.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /events/1
  # DELETE /events/1.json
  def destroy
    @event.destroy
    respond_to do |format|
      format.html { redirect_to events_url, notice: 'Event was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
      # Never trust parameters from the scary internet, only allow the white list through.
    def event_params
      params.require(:event).permit(:title, :description, :start, :end, :image, :url).merge(user_id: current_user.id)
    end
end
