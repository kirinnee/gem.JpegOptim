describe "BtJpegoptim" do


	it 'should not allow quality to be below 0' do
		expect {BT::JpegOptim.new(quality: -1)}.to raise_error ArgumentError, "Quality cannot be lower than 0%"
	end

	it 'should not allow quality to be above 100' do
		expect {BT::JpegOptim.new(quality: 101)}.to raise_error ArgumentError, "Quality cannot exceed 100%"
	end

		# it 'should properly compress images' do
		# 	target = IO.binread "target.jpg"
		# 	target.extend StreamLike
		# 	expected = IO.binread "expected.jpg"
		# 	jpegoptim = BT::JpegOptim.new(quality: 75, progressive: false)
		# 	expect(target > jpegoptim).to eq expected
		# end

end
