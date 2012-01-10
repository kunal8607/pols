class CompaniesController < ApplicationController
  def index
    Basecamp.establish_connection!('webonise.basecamphq.com','kunal.webonise','9930ghijk',true)
    @companies=Basecamp::Company.all
  end
  def persist
    require 'net/http'
    Basecamp.establish_connection!('webonise.basecamphq.com','kunal.webonise','9930ghijk',true)
    @companies=Basecamp::Company.all

    

    @companies.each do |i|
      @comp=Company.new(:basecampid =>i.id, :name=> i.name, :address=> i.address_one, :phone=> i.phone_number_office)
      @comp.save
    end

  end
  
end
