class Hospitalization < ActiveRecord::Base
  belongs_to :visit

  validates_presence_of :visit
end
