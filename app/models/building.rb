class Building < ActiveRecord::Base
  has_many :tribe_buildings
  has_many :tribes, through: :tribe_buildings

  after_create :initialize_action

  BUILDING_WAIT_PERIOD = 300
  ACTIONS = {
    "factory" => "manufacture",
    "farm" => "harvest",
    "mine" => "mine"
  }

  def initialize_action
    self.update(action: ACTIONS[self.name]) if ACTIONS[self.name]
  end

  def usable?
    self.action && (Time.now - self.last_used) > BUILDING_WAIT_PERIOD
  end

  def use
    if self.usable?
      self.update(last_used: Time.now)
      Resource.send(self.action)
    end
  end

end
