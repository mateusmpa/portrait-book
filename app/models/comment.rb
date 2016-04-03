class Comment < ActiveRecord::Base
  belongs_to :portrait
  belongs_to :user
end
