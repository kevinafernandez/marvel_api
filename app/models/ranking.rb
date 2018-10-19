class Ranking < ApplicationRecord
  paginates_per 10
  belongs_to :persona
  belongs_to :character
end
