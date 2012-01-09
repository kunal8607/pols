class PeopleController < ApplicationController
  def index
    Basecamp.establish_connection!('webonise.basecamphq.com','kunal.webonise','9930ghijk',true)
    @person=Basecamp::Person.all
  end
  def persist
    Basecamp.establish_connection!('webonise.basecamphq.com','kunal.webonise','9930ghijk',true)
    @person=Basecamp::Person.all
    @person.each do |i|
      @per=Person.new(:first_name =>i.first_name, :last_name=> i.last_name,:email_address => i.email_address , :uuid=> i.uuid,:title=> i.title,:phone_number_mobile => i.phone_number_mobile, :clientid=> i.client_id)
      @per.save
    end
  end

end
