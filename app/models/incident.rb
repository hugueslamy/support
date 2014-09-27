class Incident < ActiveRecord::Base
  include PublicActivity::Common
  
  belongs_to :departement
  belongs_to :assignee, class_name: 'User'
  belongs_to :status
  has_many :comments, -> {order(created_at: :desc)}
  after_create :assign_reference_code
  after_create :assign_status
  
  scope :unassigned, ->{ where(assignee_id: nil) }
  scope :opened, ->{ where.not(status: Status.closing.ids) }
  scope :holding, ->{ where(status: Status.holding.ids) }
  scope :closed, ->{ where(status: Status.closing.ids) }
  
  def assign_reference_code
    update_column :code, [(0...3).map { ('a'..'z').to_a[SecureRandom.random_number*26] }.join.upcase,
      SecureRandom.hex[0..1],
      (0...3).map { ('a'..'z').to_a[SecureRandom.random_number*26] }.join.upcase,
      SecureRandom.hex[0..1]].join('-')
  end
  
  def assign_status
    update_column :status_id, Status.find_by_initial(true).id
  end
end
