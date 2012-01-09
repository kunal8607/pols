class TodolistsController < ApplicationController
  def index
    @pid = 6958260
    Basecamp.establish_connection!('webonise.basecamphq.com','kunal.webonise','9930ghijk',true)
    @todolist=Basecamp::TodoList.all(@pid)
  end
  def persist
    @pid = 6958260
    Basecamp.establish_connection!('webonise.basecamphq.com','kunal.webonise','9930ghijk',true)
    @todolist=Basecamp::TodoList.all(@pid)


    @todolist.each do |i|
     @todo=Todolist.new(:name =>i.name,:completed_count=> i.completed_count, :uncompleted_count=> i.uncompleted_count,:project_id=>@pid, :complete=> i.complete)
      @todo.save
    end

  end
end
