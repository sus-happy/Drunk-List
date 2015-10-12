class Review < ActiveRecord::Base
  belongs_to :beer
  belongs_to :user
  belongs_to :counter
end
