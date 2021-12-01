class DataApi < ApplicationRecord
  validates :name, presence: true
  validates :endpoint, presence: true
  validates :queryparameters, presence: true

  def params
    queryparameters.split.map { |e| e.gsub(/{[\w]*}/, "") }
  end

end
