#class game with some attributions : human player, list of enemies and list of enemies in sight, and some features
class Game
  attr_accessor :human_player, :enemies_in_sight, :players_left

#METHOD FOR INITIALIZE VARIABLES OF INSTANCES   --------------------------------------------------------------------------------------------
  def initialize(human_player)
    @enemies_in_sight = Array.new()
    @enemies_in_sight.push(Player.new("joueur_#{rand(1000...9999)}"), Player.new("joueur_#{rand(1000...9999)}"), Player.new("joueur_#{rand(1000...9999)}"), Player.new("joueur_#{rand(1000..9999)}"),Player.new("joueur_#{rand(1000..9999)}"))
    puts
    puts "                          〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰"
    puts 
    @human_player = HumanPlayer.new(human_player)
    @players_left = 10
  end

#METHOD FOR DELETE DEAD PLAYER ! ------------------------------------------------------------------------------------------------------------
  def kill_player(player)
    @enemies_in_sight.each do |enemy| 
      if enemy.life_points <= 0
        @enemies_in_sight.delete(enemy)
        @players_left -= 1
        puts "                      un ennemi de moins ! 👍"
      end
    end
  end

#METHOD TO VERIFY IF GAME IS STILL IN PROGRESS ------------------------------------------------------------------------------------------------
  def is_still_ongoing?
     if @human_player.life_points > 0 && @players_left > 0
      return true
     else
      return false
     end
  end

#METHOD TO SHOW THE STATUS OF USER AND ENEMIES ------------------------------------------------------------------------------------------------
  def show_players
    puts "                                          📋     Récapitulatif :     📋\n"
    puts "                         〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰\n"
    puts @human_player.show_state
    puts "                           il reste #{@players_left} ennemis en vue ! 🔫"
    puts
  end 

#METHOD TO SHOW A MENU ----------------------------------------------------------------------------------------------------------------------
  def menu
    puts "                            Quelle action veux-tu effectuer ?"
    puts
    puts "                              ✅ a - chercher une meilleure arme"
    puts "                              ✅ s - chercher un pack de soin"
    puts
    puts "                         〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰"
    puts
    puts "                              attaquer un joueur en vue: \n\n"
    num = 0
    @enemies_in_sight.each do |enemy|
      if enemy.life_points > 0
        print "                              ✅ #{num} - "
        enemy.show_state
        num += 1
      puts
      end
    end
  end

#THIS METHOD DEFINE THE CHOICE OF MENU ------------------------------------------------------------------------------------------------------
  def menu_choice (input)
    if input == "a"
      @human_player.search_weapon
    elsif input == "s"
      @human_player.search_health_pack
    else 
      puts
      @human_player.attacks(@enemies_in_sight[input.to_i])
        kill_player(@enemies_in_sight[input.to_i])
    end
  end

#THIS METHOD DEFINE THE ATTACKS OF ENEMIES ---------------------------------------------------------------------------------------------------
  def enemies_attack 
    @enemies_in_sight.each do |enemy|
      enemy.attacks(@human_player)
      if enemy.life_points <= 0
        kill_player(enemy)
        break
      end  
      puts
    end
  end

#METHOD FOR THE END OF GAME -----------------------------------------------------------------------------------------------------------------
  def end
    if @human_player.life_points > 0 || @players_left == 0
      puts
      puts "                                                🎉 🎊 🎉 🎊 YOU WIN !!!  🎉 🎊 🎉 🎊 "
    else 
      puts "                                    🥺  🥺  🥺  🥺  🥺   YOU LOOOSE  🥺  🥺  🥺  🥺  🥺"
    end
  puts "                                    🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟  END OF GAME !!!  🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟"
  end

# BONUS -------------------------------------------------------------------------------------------------------------------------------------
 #METHOD FOR NEW RANDOM ENEMIES ------------------------------------------------------------------------------------------------------------- 
def new_players_in_sight
    if @enemies_in_sight.size == @players_left
      puts "                           Tous les joueurs sont en vue"
      puts
    else
      dice_roller = rand(1..6)
      case dice_roller 
        when 1
          puts "                      aucun ennemi n'a été rajouté"
          puts
        when 2..4
          @enemies_in_sight << (Player.new("joueur_ #{rand(1000...9999)}"))
          puts "                      😱 🆘   un ennemi en plus est dans la place ! 😱 🆘"
          puts
        when 5 || 6
          @enemies_in_sight << Player.new( "joueur_ #{rand(1000...9999)}")
          @enemies_in_sight << Player.new("joueur_ #{rand(1000..9999)}")
          puts "                    😱 🆘  deux ennemis viennent d'arriver !! 😱 🆘 "
          puts
      end
    end
  end
end

