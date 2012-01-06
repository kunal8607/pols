class Company < ActiveRecord::Base
  has_one :basecamp_project
end
