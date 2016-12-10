class Test < ActiveRecord::Base
  belongs_to :patient,
    inverse_of: :tests
  validates :test_type,
    presence: :true
  validates :result,
    presence: :true
end
