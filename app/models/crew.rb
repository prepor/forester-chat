class Crew < ActiveRecord::Base
  has_many :players
  belongs_to :version
end
