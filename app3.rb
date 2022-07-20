require 'bundler'
Bundler.require

require_relative 'lib/game'
require_relative 'lib/player'

# GAME'S INTRODUCTION ------------------------------------------------------------------------------------------------
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
name = gets.chomp

my_game = Game.new(name)
puts " " * 33 + "Ton nom de combattant est #{name} , grand conquérant 🏆!!"
puts

# EXECUTION OF GAME ---------------------------------------------------------------------------------------------------
while my_game.is_still_ongoing? == true
  my_game.show_players
  sleep 1
  my_game.new_players_in_sight
  puts " " * 35 + "cliquer sur entrée ⬅️ pour lancer le menu"
  print "                                     ↪️ "
  gets
  my_game.menu
  puts
  print " " * 37 + "A vous de choisir ↪️  "
  input = gets.chomp
  my_game.menu_choice(input)
  my_game.enemies_attack
end
my_game.end
