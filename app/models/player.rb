class Player < ActiveRecord::Base
  belongs_to :crew
  
  named_scope :active, :conditions => {:status => 1}
end
