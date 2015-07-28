class Picture < ActiveRecord::Base
	belongs_to :user
	validates :title, :url, :description, :user_id, :score, presence: true
	default_scope { order(score: :desc) }

	def vote i
		self.score += i
		self.save
	end
end
