class BasecampProjectsController < ApplicationController
  def index
    Basecamp.establish_connection!('webonise.basecamphq.com','kunal.webonise','9930ghijk',true)
    @projects=Basecamp::Project.all
     
  end

end
