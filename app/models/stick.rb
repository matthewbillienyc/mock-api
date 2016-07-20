class Stick < ActiveRecord::Base
  has_one :joke
  belongs_to :popsicle
end