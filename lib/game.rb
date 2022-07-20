#class game with some attributions : human player, list of enemies and list of enemies in sight, and some features
class Game
  attr_accessor :human_player, :enemies_in_sight, :players_left

  def initialize(human_player)
    @enemies_in_sight = Array.new()
    @enemies_in_sight.push(Player.new("joueur_#{rand(1000...9999)}"), Player.new("joueur_#{rand(1000...9999)}"), Player.new("joueur_#{rand(1000...9999)}"), Player.new("joueur_#{rand(1000..9999)}"),Player.new("joueur_#{rand(1000..9999)}"))
    puts
    puts " " * 26 + "〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰"
    puts 
    @human_player = HumanPlayer.new(human_player)
    @players_left = 10
  end

  def kill_player(player)
    @enemies_in_sight.each do |enemy| 
      if enemy.life_points <= 0
        @enemies_in_sight.delete(enemy)
        @players_left -= 1
        puts " " * 22 + " 🌟 un ennemi de moins ! 👍"
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

  def show_players
    puts " " * 42 + "📋     Récapitulatif :     📋\n"
    puts " " * 25 + "〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰\n"
    puts @human_player.show_state
    puts " " + "il reste #{@players_left} ennemis en vue ! 🔫"
    puts
  end 

  def menu
    puts " " * 27 + "Quelle action veux-tu effectuer ?"
    puts
    puts " " * 30 + "✅ a - chercher une meilleure arme"
    puts " " * 30 + "✅ s - chercher un pack de soin"
    puts
    puts " " * 25 + "〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰"
    puts
    puts " " * 30 + "attaquer un joueur en vue: \n\n"
    num = 0
    @enemies_in_sight.each do |enemy|
      if enemy.life_points > 0
        print " " * 30 + "✅ #{num} - "
        enemy.show_state
        num += 1
      puts
      end
    end
  end

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

  def end
    if @human_player.life_points > 0 || @players_left == 0
      puts
      puts " " * 35 + " 🎉 🎊 🎉 🎊 YOU WIN !!!  🎉 🎊 🎉 🎊 "
      puts
    else 
      puts " " * 35 + "🥺  🥺  🥺  🥺  🥺   YOU LOOOOOSE !!! 🥺  🥺  🥺  🥺  🥺"
      puts
    end
  puts " " * 28 + "🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟  END OF GAME !!!  🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟"
  end

# BONUS -------------------------------------------------------------------------------------------------------------------------------------
def new_players_in_sight
    if @enemies_in_sight.size == @players_left
      puts " " * 27 + "Tous les joueurs sont en vue"
      puts
    else
      dice_roller = rand(1..6)
      case dice_roller 
        when 1
          puts " " * 22 + "aucun ennemi n'a été rajouté 😅"
          puts
        when 2..4
          @enemies_in_sight << (Player.new("joueur_ #{rand(1000...9999)}"))
          sleep 1
          puts " " * 20 + "😱 🆘   un ennemi en plus est dans la place ! 😱 🆘"
          puts
        when 5 || 6
          @enemies_in_sight << Player.new( "joueur_ #{rand(1000...9999)}")
          @enemies_in_sight << Player.new("joueur_ #{rand(1000..9999)}")
          sleep 1
          puts " " * 20 + "😱 🆘  deux ennemis viennent d'arriver !! 😱 🆘 "
          puts
      end
    end
  end
end

