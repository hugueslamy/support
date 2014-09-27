class Comment < ActiveRecord::Base 
  belongs_to :incident, touch:true
  
  validates_presence_of :incident_id
  validates_presence_of :body
  validates_associated :incident
end
