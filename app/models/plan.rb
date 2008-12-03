class Plan < ActiveRecord::Base
  has_many :scenarios
  has_many :features, :order => "name"
  
  validates_presence_of :name
end
