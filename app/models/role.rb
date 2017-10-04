class Role < ApplicationRecord
  belongs_to :production
  belongs_to :actor, class_name: "User", optional: true
  has_many :audition_requests, dependent: :destroy
  #validates :name, presence: true

  after_create :check_nil


  def check_nil
    Role.last(3).each do |role|
      role.destroy if role.name == ""
    end
  end

  def auditioned
    self.audition_requests.select do |req|
      req.accepted
    end.map {|req| req.actor }
  end

end
