def fatorial n
	if n == 1
		return 1
	else n != 1
		return(n*fatorial(n-1))	
	end
end

puts "fatorial de 20 = %d" % fatorial(20)
