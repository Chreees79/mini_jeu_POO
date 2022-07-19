require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# GAME'S INTRODUCTION ------------------------------------------------------------------------------------------------------------------
puts
puts "                                ----------------------------------------------------------"
puts "                               | Bievenue dans le jeu de combat ILS VEULENT TOUS MA POO ! |"
puts "                               |                 🧨  🧨  🧨  🧨  🧨  🧨                     |"
puts "                               |    Le but du jeu est d'être le dernier survivant !       |"
puts "                                ----------------------------------------------------------"
sleep 1
puts
puts "                                       Appuyer sur entrée ⬅️  pour commencer le jeu..."
puts "                                              ↪️ "
gets
puts "                                            Quel est ton pseudo de joueur ?\r"
print "                                             ↪️ "
user = gets.chomp
user = HumanPlayer.new(user)
puts "                              votre nom de combattant est #{user.name} le(la) conquérant(e) !! 🎊"
puts
  enemies = []
  player1 = Player.new("José")
  player2 = Player.new("Josiane")
  enemies.push(player1, player2)

  puts
  puts "       🆘  🆘  🆘 des enemis sont présents, ils sont : #{enemies.length} au nom de #{player1.name} et de #{player2.name}. 🆘  🆘  🆘  🆘 "
  puts
  puts "                              ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩"
  puts 

  # EXECUTION OF GAME  ----------------------------------------------------------------------------------------------------------------------
  while user.life_points > 0 && player1.life_points > 0 || player2.life_points > 0 do
    puts "                            Quelle action veux-tu effectuer ?"
    puts
    puts "                              ✅ a - chercher une meilleure arme"
    puts "                              ✅ s - chercher un pack de soin"
    puts
    puts "                         〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰"
    puts
    puts "                              attaquer un joueur en vue: \n\n"
    print "                              📛   0 -  "
    player1.show_state
    print"                              📛   1 -  "
    player2.show_state
    print "                                   ↪️ "
    user_input = gets.chomp
      if user_input == "a"
        user.search_weapon
      elsif user_input == "s"
        user.search_health_pack
      elsif user_input == "0"
        user.attacks(player1)
        if player1.life_points <= 0
          break
        end
      else user_input == "1"
        user.attacks(player2)
          if player2.life_points <= 0
            break
          end
      end
    puts
    puts "                           ❌      ❌     Attention ! Les autres joueurs t'attaquent!!!     ❌       ❌"
    enemies.each do |enemie|
    enemie.attacks(user)
      if user.life_points <= 0
        break
        end    
      end
    puts
    puts "                                📋   après cette attaque : "
    puts
    user.show_state
    player1.show_state
    player2.show_state
  end
# END OF GAME  -----------------------------------------------------------------------------------------------------------------------------
  if user.life_points > 0
    puts "                                                 🏆   🏆   🏆   YOU WIN !!!  🏆   🏆   🏆"
    puts
  else 
    puts "                                               😱   😱   😱   YOU LOOOSE !!!  😱   😱   😱"
    puts
  end
puts "                                  🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟  END OF GAME !!!  🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟"


