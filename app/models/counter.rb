class Counter < ActiveRecord::Base
  belongs_to :beer
  belongs_to :counters
end
