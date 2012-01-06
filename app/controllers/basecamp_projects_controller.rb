class BasecampProjectsController < ApplicationController
  def index
    Basecamp.establish_connection!('webonise.basecamphq.com','kunal.webonise','9930ghijk',true)
    @projects=Basecamp::Project.all
     
  end

  def persist
    Basecamp.establish_connection!('webonise.basecamphq.com','kunal.webonise','9930ghijk',true)
    @projects=Basecamp::Project.all

    @projects.each do |i|
      @proj=BasecampProject.new(:basecampid =>i.id, :name=> i.name, :status=> i.status, :created_on=> i.created_on,:company_id =>i.company.id)
      @proj.save

    end

  end

  Basecamp::Person
end
