class Comment < ActiveRecord::Base
  belongs_to :user, dependent: :destroy
  belongs_to :topic, dependent: :destroy
end
