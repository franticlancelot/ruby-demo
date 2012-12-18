require 'benchmark'

iterations = 100000

Benchmark.bm do |bm|
	bm.report("for:") do
	for i in 1..iterations do
		x=1
	end
	end

	bm.report("times:") do
		iterations.times do |i|
			x = i
		end
	end
end

