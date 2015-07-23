class Picture < ActiveRecord::Base
	belongs_to :author
	validates :title, :url, :description, presence: true
end
