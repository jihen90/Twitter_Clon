class Tweet < ApplicationRecord
    belongs_to :user
    belongs_to :main, class_name: "Tweet", optional: true
    has_many :likes, dependent: :destroy
    validates :content, presence: true

    def rt_count
        Tweet.eager_load(:likes).where(main_id: self.id).count
    end

    def rt_from
        retweets = Tweet.eager_load(:likes).where(main_id: self.id)
        users_rt = []
        retweets.each do |retweet|
            users_rt << retweet.user.name
        end
        users_rt = users_rt.uniq
        return users_rt.count
    end

    def likes_count
        self.likes.count
    end
end