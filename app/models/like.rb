class Like < ActiveRecord::Base
  belongs_to :Prototypes, :counter_cathe => true
end
