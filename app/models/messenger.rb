class Messenger < ActiveRecord::Base
  has_one :gift
  belongs_to :tribe
  belongs_to :destination, foreign_key: :destination_id, class_name: 'Tribe'

  def rejected?
    self.rejected?
  end

  def reject
    self.update(rejected: true)
  end

  def give_message(msg)
    self.update(message: msg)
  end
end
