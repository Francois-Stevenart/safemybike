class Feature < ApplicationRecord
  has_many :feature_presences
  has_many :garages, through: :feature_presences
end
