class Status < ActiveRecord::Base
  has_many :incidents
  
  validates_presence_of :name
  
  before_update :clear_initial
  
  scope :defaulting_to, -> {where(initial: true)}
  scope :closing, -> {where(closing: true)}
  scope :holding, -> {where(holding: true)}
  
  def clear_initial
    if initial_changed?
      Status.update_all(initial: false)
    end
  end
end
