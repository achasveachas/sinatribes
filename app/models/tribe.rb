class Tribe < ActiveRecord::Base
  belongs_to :user
  belongs_to :religion
  has_one :population
  has_one :warriors, through: :population
  has_one :farmers, through: :population
  has_one :priests, through: :population
  has_many :messengers
  has_many :tribe_buildings
  has_many :buildings, through: :tribe_buildings
  has_many :resources

  def initialize(args)
    super
    self.update(
      population: self.population || Population.create,
      religion: self.religion || Religion.all.sample
    )
  end

  def add_money(amt)
    self.update(money: self.money + amt)
  end

  def lose_money(amt)
    self.money >= amt ? self.update(money: self.money - amt) : false
  end

  def add_warriors(amt)
    self.update(warriors: self.warriors + amt)
  end

  def lose_warriors(amt)
    self.warriors >= amt ? self.update(warriors: self.warriors - amt) : false
  end

  def collect_resource(resource)
    resource.update(tribe: self, gift: nil)
  end

  def add_resource(resource_name)
    self.resources.create(name: resource_name)
  end

end
