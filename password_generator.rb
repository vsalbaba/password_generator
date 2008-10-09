
module PasswordGenerator

	@@word_patterns = ["vccvc", "cvcvcc", "cvccvc", "cvcvc"]
	@@password_patterns = ["wnnc", "wnnn"]

	def add_word_pattern pattern
		@@word_patterns << pattern
	end
	
	def add_password_pattern pattern
		@@password_patterns << pattern
	end
	
	def word_patterns
		@@word_patterns
	end
	
	def password_patterns
		@@password_patterns
	end
	
	def password_patterns= (patterns)
		@@password_patterns = patterns
	end
	
	def word_patterns= (patterns	)
		@@word_patterns = patterns
	end
	
	def generate_password
		read_pattern @@password_patterns.rand
	end
	
	def generate_word
		read_pattern @@word_patterns.rand
	end
	
protected
	def vocal
		['a', 'e', 'i', 'o', 'u', 'y'].rand
	end

	def consonant
		['b', 'c', 'd', 'f','g','h','j','k','l','m','n','p','q','r','s','t','v','z'].rand
	end

	def read_pattern pattern
		result = ""
		pattern.each_byte do |a| 
			case a.chr
			when 'v'
				result += vocal
				
			when 'c'
				result += consonant
			when 'w'
				result += generate_word
			when 'n'
				result += rand(9).to_s
			end
		end
		return result
	end
end
