class Event < ActiveRecord::Base
  @@per_page = 25

  belongs_to :page

  validates_presence_of :event_date
  validates_presence_of :title
#  validates_presence_of :body
  validates_length_of :title, :maximum => 5000
  validates_length_of :body, :maximum => 20000

end