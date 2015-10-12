class Beer < ActiveRecord::Base
  has_many :counters, dependent: :destroy
  has_many :reviews, dependent: :destroy
end
