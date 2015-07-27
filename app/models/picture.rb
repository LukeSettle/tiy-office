class Picture < ActiveRecord::Base
	belongs_to :author
	validates :title, :url, :description, :author_id, :score, presence: true
	default_scope { order(score: :desc) }

	def vote i
		self.score += i
		self.save
	end
end
