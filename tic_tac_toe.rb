# Plays a game of tic-tac-toe. I got it working for one round.

class Player
    def initialize(player_name)
      @player_name = player_name
      @player_array = Array.new # Stores which tiles are players to check if they won
    end
   
    # Pushes the player choice to an array so it can check for a win on the game board
    def to_player_array(number_on_board)
      @player_array.push(number_on_board)
    end
   
    def check_player_array()
     return @player_array
    end
   
   end
   
   class Draw_Board
    def initialize(array)
      @@game_board = array
    end
   
    def update_board(array)
      p " - - - - - "
      p " #{@@game_board[1]} | #{@@game_board[2]} | #{@@game_board[3]} "
      p " - - - - - "
      p " #{@@game_board[4]} | #{@@game_board[5]} | #{@@game_board[6]} "
      p " - - - - - "
      p " #{@@game_board[7]} | #{@@game_board[8]} | #{@@game_board[9]} "
      p " - - - - - "
    end
   
   end
   
   class Play_Game
    def initialize(player1, player2, game_board)
      @player1 = player1
      @player2 = player2
      @current_player = @player1
      @current_symbol = 'X'
      @game_board = game_board
     end
   
    def play_Turn()
      p "#{@current_player}, where do you want to make your mark? "
      @@player_choice = gets.chomp.to_i # Checks the location in the game_board array
      while valid_Move(@@player_choice, @game_board) == false do
        p "You cheeky son-of-a-biscuit-muncher, choose a valid square."
        @@player_choice = gets.chomp.to_i
      end
     
      @current_player.to_player_array(@@player_choice)
      @game_board[@@player_choice] = @current_symbol
      @game.update_board(@game_board)
      check_Win(@current_player.check_player_array)
      @current_player = @current_player ==  @player1 ? @current_player = @player2 : @current_player = @player1 #Changes players
      @current_symbol = @current_symbol == "X" ? @current_symbol = "O" : @current_symbol = "X"  #Changes symbols for game board
     end
   
     def play_Round(game_board) # Play until someone wins
       @currently_playing = true
       @game = Draw_Board.new(game_board)
       @game.update_board(game_board)
       while @currently_playing == true do
         play_Turn()
       end
       # After the game is over start a new game
       @currently_playing = true
       play_Round(game_board)
   
     end
   
     def valid_Move(input, game_board)
       if input > 9 || input < 1
         return false
       elsif !game_board.include? input
         return false
       else
         return true
       end
     end
   
     def check_Win(player_array)
       @@player_array = player_array
       @@win_condition = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]]
   
       @@win_condition.all? { |win1, win2, win3| 
       @@player_array = @@player_array.sort
       @@win = [win1, win2, win3]
       case
       when @@win.all? { |win| @@player_array.include?(win)} == true
         p "WIIIN"
         end_Game()
         break
       else
         p @@player_array
       end
       }
   
     end
   
     def end_Game()
       p "The game is over."
       p "Do you want to play again? ('yes')"
       @@input = gets.chomp
       while @@input != "yes" || "no" do
        p "You cheeky son-of-a-biscuit-muncher, I said type 'yes'."
        if @@input == "yes"
         @currently_playing = false
        else
         system "clear"
         p "XLZZ TERMINAL ERROR"
        end
       end
   
     end
   
   
   end
   
   puts "Time to start a game of tic-tac-toe!"
   puts "The player that can get three in a row wins."
   player1 = Player.new("player1")
   player2 = Player.new("player2")
   game_board = ["such_quality",1,2,3,4,5,6,7,8,9]
   new_game = Play_Game.new(player1, player2, game_board)
   new_game.play_Round(game_board)