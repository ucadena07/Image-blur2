class Image 
	def initialize(picture)
		@picture = picture
	end

	def find_ones
		ones = []

		@picture.each_with_index do |inner_array, outer_index|
			inner_array.each_with_index do |num, num_index|
				if num == 1
					ones << [outer_index, num_index]
				end
			end
		end
		ones
	end

	def blur
		ones = find_ones

		@picture.each_with_index do |inner_array, outer_index|
			inner_array.each_with_index do |num, num_index|
				ones.each do |found_outer_index, found_num_index|

					if num_index == found_num_index && found_outer_index == outer_index
						@picture[outer_index - 1][num_index] = 1 unless outer_index == 0
						@picture[outer_index + 1][num_index] = 1 unless outer_index >= 3
						@picture[outer_index][num_index - 1] = 1 unless num_index == 0
						@picture[outer_index][num_index + 1] = 1 unless num_index >= 3
					end
				end
			end
		end

	end

	def output_image
		@picture.each do |row|
			puts row.join
		end
	end

end

image = Image.new([
	[0,0,0,0],
	[0,1,0,0],
	[0,0,0,1],
	[0,0,0,0]

])

image.blur
image.output_image