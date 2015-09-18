class AController < ApplicationController
  layout "angular"
  #GET /a
  #GET /a.json
  def index
    @events = Event.where("end >= ?", DateTime.now).order("start ASC")
    @sermons = Sermon.where("end >= ?", DateTime.now).order("start ASC")
    @alerts = Alert.where("end >= ?", DateTime.now).order("start ASC")
  end

end
