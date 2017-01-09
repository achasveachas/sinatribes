class Building < ActiveRecord::Base
  has_many :tribe_buildings
  has_many :tribes, through: :tribe_buildings

  after_create :initialize_action

  ACTIONS = {
    "factory" => "manufacture",
    "farm" => "harvest",
    "mine" => "mine",
    "barracks" => "train"
  }

  def initialize_action
    self.update(action: action) if action = ACTIONS[self.name]
  end

end
