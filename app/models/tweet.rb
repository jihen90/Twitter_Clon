class Tweet < ApplicationRecord
    belongs_to :user
    belongs_to :main, class_name: "Tweet", optional: true
    has_many :likes, dependent: :destroy
    #default_scope -> { order('created_at DESC') }
    validates :content, presence: true

    def rt_count
        Tweet.where(main_id: self.id).count
    end

    def likes_count
        self.likes.count
    end
end