class Test < ActiveRecord::Base
  belongs_to :visit, inverse_of: :tests
  validates :visit,
    presence: true
  validates :test_type,
    presence: :true
  validates :result,
    presence: :true
end
