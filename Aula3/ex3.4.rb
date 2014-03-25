
def upcase frase
	maiusculas = {'a' => 'A', 'b' => 'B', 'c' => 'C', 'd' => 'D', 'e' => 'E', 
			      'f' => 'F', 'g' => 'G', 'h' => 'H', 'i' => 'I', 'j' => 'J', 
			      'k' => 'K', 'l' => 'L', 'm' => 'M', 'n' => 'N', 'o' => 'O',
			      'p' => 'P', 'q' => 'Q', 'r' => 'R', 's' => 'S', 't' => 'T',
			      'u' => 'U', 'v' => 'V', 'w' => 'W', 'x' => 'X', 'y' => 'Y', 
			      'z' => 'Z'}
	novafrase = ''
	frase.each_char do |letra|
		if maiusculas.key?(letra)
			novafrase = novafrase + maiusculas[letra]
		else
			novafrase = novafrase + letra
		end
	end
	return novafrase
end

frase = 'introducao a ruby finalizada'
gritando =  upcase(frase)
puts gritando