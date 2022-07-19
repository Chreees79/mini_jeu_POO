require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# GAME'S INTRODUCTION ------------------------------------------------------------------------------------------------
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
name = gets.chomp

my_game = Game.new(name)
puts "                                Ton nom de combattant est #{name} , grand conquérant 🏆!!"
puts

# EXECUTION OF GAME ---------------------------------------------------------------------------------------------------
while my_game.is_still_ongoing? == true
  my_game.show_players
  sleep 1
  my_game.new_players_in_sight
  puts "                                   cliquer sur entrée ⬅️ pour lancer le menu"
  print "                                     ↪️ "
  gets
  my_game.menu
  puts
  print "                                     A vous de choisir ↪️  "
  input = gets.chomp
  my_game.menu_choice(input)
  my_game.enemies_attack
end
my_game.end
