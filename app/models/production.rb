class Production < ApplicationRecord
  belongs_to :studio, class_name: "User"
  has_many :roles, dependent: :destroy
  has_many :actors, class_name: "User", through: :roles
  has_many :audition_requests, through: :roles

  accepts_nested_attributes_for :roles

  def check_date_overlaps
    start_date = self.date_begin
    end_date = self.date_end
    @users = User.all.select{|user| user.is_studio == 0}

    @users.select do |user|
      user.actor_productions.map do |prod|
        if (prod.date_begin < start_date) && (prod.date_end > start_date)
          prod
        elsif (prod.date_begin > start_date) && (prod.date_begin < end_date)
          prod
        else
          prod = nil
        end
      end.compact.empty?
    end
  end

  def send_audition_request(params)
    self.roles.each do |role|
      if params.keys.include?(role.name) && params[role.name]["actor_id"]!=""
        AuditionRequest.create(role_id: role.id, actor_id: params[role.name]["actor_id"])
      end
    end
  end

  def update_role(params)
    self.roles.each do |role|
      if params.keys.include?(role.name) && params[role.name]["actor_id"]!=""
        role.actor = User.find(params[role.name]["actor_id"])
        role.save
      end
    end
  end

  def empty_roles
    self.roles.select do |role|
      role.actor_id == nil
    end
  end

  def filled_roles
    self.roles.select do |role|
      role.actor_id
    end
  end


end
