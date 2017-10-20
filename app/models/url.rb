class Url < ApplicationRecord

	validates :long_url, presence: true, uniqueness: {case_sensitive: false, message: "was shortened before"}

  	validates :long_url, format: {with: (URI::regexp(['http', 'https'])), message: "format is not good"}


	def shorten
		self.short_url = SecureRandom.hex(3) + rand(0..9).to_s
		self.save
		# array = ("0".."9").to_a + ("a".."z").to_a + ("A".."Z").to_a

		# @short_url = []

		# 7.times do
		# 	@short_url << array.sample
		# end

		# short = @short_url.join
		
  #   	return short
	end

end
