require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# INTRODUCTION OF GAME  ------------------------------------------------------------------------------------------------------
player1 = Player.new("Josiane")
player2 = Player.new("José")
puts
puts "                                ----------------------------------------------------------"
puts "                               | Bievenue dans le jeu de combat ILS VEULENT TOUS MA POO ! |"
puts "                               |                 🧨  🧨  🧨  🧨  🧨  🧨                     |"
puts "                               |    Le but du jeu est d'être le dernier survivant !       |"
puts "                                ----------------------------------------------------------"
sleep 1

# EXECUTION OF GAME --------------------------------------------------------------------------------------------------------------
while player1.life_points > 0 || player2.life_points > 0 do
  puts
  puts " 〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰"
  puts
  player1.show_state
  puts
  puts " 〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰"
  puts
  player2.show_state
  puts
  puts " 〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰〰"
  puts
  puts
  puts"                               🧨    🧨    🧨    🧨    🧨     ATTACK!!     🧨   🧨    🧨    🧨     🧨    🧨"
  puts 
  player1.attacks(player2)
  if player2.life_points <= 0
    break
  end
  player2.attacks(player1)
    if player1.life_points <= 0
      break
    end
  puts
end
puts
puts "                                  🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟  END OF GAME !!!  🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟🌟"
