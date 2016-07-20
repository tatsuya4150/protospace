class Comment < ActiveRecord::Base
#associations
belongs_to :user
belongs_to :prototype
end
