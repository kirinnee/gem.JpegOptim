require "bt_jpegoptim/version"
require "bt_jpegoptim/shell_helper"
require "binary_transformer"

using BT

module BT
	class JpegOptim < BinaryTransformer::Transformer


		def initialize(strip_all: true, progressive: true, quality: 75)
			raise ArgumentError.new "Quality cannot be lower than 0%" if quality < 0
			raise ArgumentError.new "Quality cannot exceed 100%" if quality > 100
			@strip = strip_all ? "-s" : ""
			@quality = "--max=#{quality}"
			@progressive = progressive ? "--all-progressive" : "--all-normal"
		end

		def transform(bytes)
			"jpegoptim #{arguments.join " " }" << bytes
		end

		def arguments
			["--stdin", "--stdout", @strip, @quality, @progressive]
				.select {|x| !x.empty? && !x.nil?}
		end

		# @return [Array<String>]
		def accepted_type
			["image/jpeg"]
		end
	end
end
