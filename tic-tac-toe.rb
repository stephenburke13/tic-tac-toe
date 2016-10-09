class Player
	
	def new_player(player_number)
		puts "Player #{player_number}, what is your name?"
		player_name = gets.chomp
		puts "#{player_name}, what letter will you play as?"
		player_letter = gets.chomp
		puts "Thank you #{player_name}!"
		return player_name, player_letter
	end

	attr_accessor :name, :letter

	def initialize(player_number)
		@name, @letter = new_player(player_number)
	end
	
end


class Board
	attr_accessor :squares
	def initialize
		@squares = [1,2,3,4,5,6,7,8,9]
	end

	def show_board
		puts "
			[#{@squares[0]}][#{@squares[1]}][#{@squares[2]}]\n
			[#{@squares[3]}][#{@squares[4]}][#{@squares[5]}]\n
			[#{@squares[6]}][#{@squares[7]}][#{@squares[8]}]\n"
	end

end

class Game
	def initialize
		@player_1 = Player.new(1)
		@player_2 = Player.new(2)
		@won = false
		@game_board = Board.new
		@game_board.show_board
		game_loop
	end

	def winning?(player, board)
		winning_conditions = [[1,2,3],[4,5,6],[7,8,9],[1,4,7],[2,5,8],[3,6,9],[1,5,9],[3,5,7]]
		winning_conditions.each do |condition|
			result = 0
			condition.each do |number|
				result += 1 if board.squares[number-1] == player.letter
				return true if result == 3
			end
		end
		false
	end

	def turn(player, board)
		puts "Your move, #{player.name}. Choose a number between 1 and 9"
		move = gets.chomp.to_i
		if board.squares.index(move)
			board.squares[move-1] = player.letter
			board.show_board
			@won = true if winning?(player, board)
		else
			puts "Hmm, I don't think you can do that."
			turn(player, board)
		end
	end

	def game_loop
		while true
			unless @won
				turn(@player_1, @game_board)
			else
				puts "You won, #{@player_2.name}!"
				break
			end

			unless @won
				turn(@player_2, @game_board)
			else
				puts "You won, #{@player_1.name}!"
				break
			end
		end
		restart
	end

	def restart
		puts "Do you want to play again? yes/no "
		answer = gets.chomp.downcase
		if answer == "yes"
			current_game = Game.new 
		elsif answer == "no"
			puts "Thanks for playing!"
			exit
		else
			puts "I don't think that's one of the options."
			restart
		end
	end

end

current_game = Game.new







