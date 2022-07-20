#class Player with some attributions : name and life points and some methods
class Player 
attr_accessor :name, :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end 

  def show_state
    puts "#{@name} a #{@life_points} points de vie"
  end

  def gets_damage(points_damage)
    @life_points -= points_damage.to_i 
    if @life_points <= 0 
      puts "le joueur #{@name} a été tué !\n"
    end
  end

  def attacks(other_player)
      puts "#{@name} attaque #{other_player.name} !"
      points_of_attack = compute_damage
      puts "il(elle) lui inflige #{points_of_attack} points de dommage(s)\n"
      other_player.gets_damage(points_of_attack)
  end

  def compute_damage 
    return rand(1..6)
  end
end

#class HumanPlayer inherit of class Player and with one more attribution : weapon level and some features
class HumanPlayer < Player
  attr_accessor :weapon_level

  def initialize(name)
    @weapon_level = 1
    @name = name
    @life_points = 100
  end
  def show_state
    puts " #{name} a #{life_points} points de vie et arme de niveau #{@weapon_level} "
  end

  def compute_damage
    rand(1..6) * @weapon_level
  end

  def search_weapon 
    new_weapon_find = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{new_weapon_find} ! 🏹 "
    puts
    if new_weapon_find > @weapon_level
      @weapon_level = new_weapon_find
      puts "Youhou! tu es tombé sur un engin de la mort: tu le prends fissa !"
      puts
    else new_weapon_find <= @weapon_level
      puts "et Fichtre!! ce n'est pas mieux que ton arme actuelle... 🤷 "
      puts
    end
  end

  def search_health_pack
    health_pack_found = rand(1..6)
    puts "health_pack_found"
      case health_pack_found
      when 1
        puts "Tu n'as rien trouvé...\n"
      when 2..5
        @life_points = @life_points + 80
        puts "Bravo, tu as trouvé un pack de +80 points de vie ! 💊"
        puts
      when 6
        @life_points = @life_points + 50 
        puts "Bravo, tu as trouvé un pack de +50 points de vie ! 💊"
        puts
      end
    if @life_points > 100
      @life_points = 100
      puts "Tu as atteint le maximum de points de vie."
      puts
    else
      puts "Ton niveau de vie est de #{@life_points} points de vie."
      puts
    end
  end
end





