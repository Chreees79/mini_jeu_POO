require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# GAME'S INTRODUCTION ------------------------------------------------------------------------------------------------------------------
puts
puts " " * 32 + "-" * 58
puts " " * 31 + "| Bievenue dans le jeu de combat ILS VEULENT TOUS MA POO ! |"
puts " " * 31 + "|" + " " * 17 + "🧨  🧨  🧨  🧨  🧨  🧨" + " "* 19 + "|"
puts " " * 31 + "|    Le but du jeu est d'être le dernier survivant !       |"
puts " " * 32 + "-" * 58
sleep 1
puts
puts " " * 39 + "Appuyer sur entrée ⬅️  pour commencer le jeu..."
puts " " * 45 + "↪️ "
gets
puts " " * 45 + "Quel est ton pseudo de joueur ?\r"
print " " * 45 + "↪️ "
user = gets.chomp
user = HumanPlayer.new(user)
puts " " * 30 + "votre nom de combattant est #{user.name} le(la) conquérant(e) !! 🎊"
puts
  enemies = []
  player1 = Player.new("José")
  player2 = Player.new("Josiane")
  enemies.push(player1, player2)

  puts
  puts " " * 7 + "🆘  🆘  🆘 des enemis sont présents, ils sont : #{enemies.length} au nom de #{player1.name} et de #{player2.name}. 🆘  🆘  🆘  🆘 "
  puts
  puts " " * 32 + "✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩  ✩"
  puts 

  # EXECUTION OF GAME  ----------------------------------------------------------------------------------------------------------------------
  while user.life_points > 0 && player1.life_points > 0 || player2.life_points > 0 do
    puts " " * 28 + "Quelle action veux-tu effectuer ?"
    puts
    puts " " * 30 + "✅ a - chercher une meilleure arme"
    puts " " * 30 + "✅ s - chercher un pack de soin"
    puts
    puts " " *25 + "〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰"
    puts
    puts " " * 30 + "attaquer un joueur en vue: \n\n"
    print " " * 30 + "📛   0 -  "
    player1.show_state
    print" " * 30 + "📛   1 -  "
    player2.show_state
    print " " * 35 + "↪️  "
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
    puts " " + "❌      ❌     Attention ! Les autres joueurs t'attaquent!!!     ❌       ❌"
    enemies.each do |enemie|
    enemie.attacks(user)
      if user.life_points <= 0
        break
        end    
      end
    puts
    puts " " * 32 + "📋   après cette attaque : "
    puts
    user.show_state
    player1.show_state
    player2.show_state
  end
# END OF GAME  -----------------------------------------------------------------------------------------------------------------------------
  if user.life_points > 0
    puts " " * 49 + "🏆   🏆   🏆   YOU WIN !!!  🏆   🏆   🏆"
    puts
  else 
    puts " " * 47 + "😱   😱   😱   YOU LOOOSE !!!  😱   😱   😱"
    puts
  end
puts " " * 34 + "🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟  END OF GAME !!!  🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟"


