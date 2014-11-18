class User < ActiveRecord::Base
  has_many :subscriptions, foreign_key: :follower_id, dependent: :destroy
  has_many :leaders, through: :subscriptions
  has_many :reverse_subcriptions, foreign_key: :leader_id, class_name: "Subscription", dependent: :destroy
  has_many :followers, through: :reverse_subcriptions
  
  def following?(leader)
    leaders.include? leader
  end
  
  def follow!(leader)
    if leader != self && !following?(leader)
      leaders << leader
      end
  end
end