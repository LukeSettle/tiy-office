class Picture < ActiveRecord::Base
	belongs_to :author
	validates :title, :url, :description, :author_id, :score, presence: true
end
