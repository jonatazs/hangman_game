

class HangmanTest
	

	def initialize
		logic
	end

	
	
  #  def game
  #    print "x = Hangman.new "
  #    print "word= x.randomword"
  #    print "word_clue = x.clue(word)"
  #    print "guess_count = x.guesses(word)"
    
  #    print "logic()"
  #  end


  def logic

    word = randomword.downcase
    word_clue = clue(word)
    puts "#{word}"
    guess_count = guesses(word) 
    guess_count_array = []
    word_array = []

    word.each_char do |char|
	    word_array.push(char)
    end
    #puts "Testando o word_array"
    #puts "#{word_array}"


    puts "Welcome to the new hangman game, good luck!"
    puts "What is your name?"
    name = gets.chomp
    # puts "#{word}"
    puts "This is the word #{word_clue} \nyou have #{guess_count} chances to strike the correct answer!"
    puts "Let's start the game #{name}"
    puts
    i = 1
    while i < guess_count
    
      puts "\nThis is your #{i}° shoot"
      puts "Choose a letter"
      guess = gets.chomp
      puts "This is your guess: #{guess}"
    
    
      if word.include?(guess)
        puts ""
        guess_count_array = word_array.each_index.select {|i| word_array[i] == guess}
        for value in guess_count_array
          word_clue[value] = guess
        end
      else
        puts "wrong letter"
      end
      check_win(word_clue, word)
      puts word_clue
      i += 1
    end
    replay_game()		
		
	end
  
  #Cheks win victory
  
  def check_win(string1, string2)
    won = true
  
    string1.each_char do |char|
      if string2.include? char
        print char
      else
        print '-'
        won = false
      end
    end
    puts ""
    if won
      puts "Congratulation! Victory!"
      replay_game()
    else
      puts "You have lost"
      return won
    end
    return won
  end


  def replay_game
    puts "Do you would like to play again? (y/n)"
    decision = gets.chomp
    system 'clear'
    if decision == "y" || decision == "Y"
      x = HangmanTest.new 
    else
      system "clear"
      exit
      
    end   
  end
  
  

	#stabloish the maximum guesses based on the word length
	def guesses(word)
		max_guess = 0
		if word.length >= 3 && word.length <= 6
			max_guess = word.length
		else
			max_guess = word.length
		end
		max_guess	
	end

	def randomword
			#set the word for a variable
			@random_word = nil
			#open the file
			File.open('5desk.txt') do |file|
				file_lines = file.readlines()
				#choose a randon word between
				temp_word = file_lines[Random.rand(0..file_lines.size())]
				#check if the letters is between 5 and 8 length
				if temp_word.length >= 5 && temp_word.length <=8
						@random_word = temp_word.to_s
				else
						randomword()
				end
			end
			@random_word     
	end
	
	def clue(word)
		#create a word with a clue the same size of the random word
		test_word = word	
		#set the  variable with - instead the word
		test2 = test_word.sub test_word[0...test_word.length], '-' * (test_word.length - 1)		
			#if the word is between 5 and 6 length will have one clue
		if test_word.length >= 5 && test_word.length <=6
			test2[3] = word[3]
			test2
			#if the word is greater than 6 will 2 clues
		else
			test2[2], test2[5] = word[2], word[5]
			test2
		end

		test2   

	end 


		

  # puts "Initializing this game"
  # @word = randomword
  # @word_clue = clue(@word)
  # @guess_count = guesses(@word)
  # logic()

    
end


x = HangmanTest.new 






