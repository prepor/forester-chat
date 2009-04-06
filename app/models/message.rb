class Message < ActiveRecord::Base
  belongs_to :crew
  belongs_to :player
  
  def alert=(val)
    val == "1" ? self.vis = 'alert' : val
  end
  
  def alert
    false
  end
end
