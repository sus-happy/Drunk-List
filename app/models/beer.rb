class Beer < ActiveRecord::Base
  has_many :counters, dependent: :destroy
end
