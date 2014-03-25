def ordena vetor
	sorted = vetor.sort
	return sorted
end

entrada = [20, 0, 50, 30, 34, 33, 35, 22, 1]
ordenado = ordena(entrada)

ordenado.each do |elemento|
	print "%d " % elemento 	
end

puts ''