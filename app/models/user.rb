class User < ApplicationRecord
    has_many :likes #１対多
    has_many :like_tweets, through: :likes, source: :tweet
end
