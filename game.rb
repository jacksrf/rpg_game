# Team 4 the Win
# GOTTA CATCH EM ALL
#$ = {name: "", attack1: "", attack2: "", attack3: "", health: }

require "colorize"

$player_name = ""
$current_pokemon = []
$current_enemy = []
$pokedex = []
$current_enemy_index = 0

$bulbasaur = [{name: "Bulbasaur", attack1: "Tackle", attack2: "growl", attack3: "Seed Bomb", health: 45, attack_power: 49, defense: 49, xp:1},
{name: "Ivysaur", attack1: "Tackle", attack2: "Growl", attack3: "Petal Blizzard", health: 60, attack_power: 62, defense: 63, xp:1},
{name: "Venusaur", attack1: "Tackle", attack2: "growl", attack3: "Solar Beam", health: 80, attack_power: 82, defense: 83, xp:1}]

$charmander= [{name: "Charmander", attack1: "growl", attack2: "scratch", attack3: "Inferno", health: 39, attack_power: 52, defense: 43, xp:1},
{name: "Charmeleon", attack1: "growl", attack2: "scratch", attack3: "Ember", health: 58, attack_power: 64, defense: 58, xp:1},
{name: "Charizard", attack1: "Air Slash", attack2: "Dragon Claw", attack3: "Flare Blitz", health: 78, attack_power: 84, defense: 78, xp:1}]

$squirtle = [{name: "Squirtle", attack1: "Tackle", attack2: "Tail Whip", attack3: "Hydro Pump", health: 44, attack_power: 48, defense: 65, xp:1},
{name: "Wartortle", attack1: "Tackle", attack2: "Tail Whip", attack3: "Hydro Pump", health: 59, attack_power: 63, defense: 80, xp:1},
{name: "Blastoise", attack1: "Tackle", attack2: "Tail Whip", attack3: "Hydro Pump", health: 79, attack_power: 83, defense: 100, xp:1}]

$enemyPool1 =[{name: "Caterpie", attack1: "String Shot", attack2: "Tackle", attack3: "Bug Bite", health: 45, attack_power: 30, defense: 35},
 {name: "Metapod", attack1: "Harden", attack2: "Harden", attack3: "Harden", health: 50, attack_power: 20, defense: 55},
 {name: "Butterfree", attack1: "Confusion", attack2: "Poison Powder", attack3: "Quiver Dance", health: 60, attack_power: 45, defense: 50}]


def battle()
  $player_health = $current_pokemon[0][:health]
  $enemy_health = $current_enemy[0][:health]
  i = 2
  puts "POKEMON: you are battling #{$current_enemy[0][:name]}, its XP is #{$current_enemy[0][:health]}, Attack Power is #{$current_enemy[0][:attack_power]}, and Defense Power is #{$current_enemy[0][:defense]}".colorize(:red)

  while (i > 1)
    puts "player health is #{$player_health} and enemy health is #{$enemy_health}"
    puts "Whats your attack? Choose (1 for #{$current_pokemon[0][:attack1]}, 2 for #{$current_pokemon[0][:attack2]}, 3 for #{$current_pokemon[0][:attack3]})".colorize(:yellow)
    attackNumber = gets.chomp

      if attackNumber == "1"
        attack = $current_pokemon[0][:attack1]
      elsif attackNumber == "2"
        attack = $current_pokemon[0][:attack2]
      elsif attackNumber == "3"
        attack = $current_pokemon[0][:attack3]
      end

    diceRoll = rand(1..100)
    enemyHealthDeduction = diceRoll - $current_enemy[0][:defense]

      if enemyHealthDeduction > 0 && i > 1
        $enemy_health -= enemyHealthDeduction
        if $enemy_health < 0
          puts enemyHealthDeduction
          puts "Your #{attack} made a hit! #{$current_enemy[0][:name]} health down to 0"
          i-= 2
        else
          puts enemyHealthDeduction
          puts "Your #{attack} made a hit! #{$current_enemy[0][:name]} health down to #{$enemy_health}"
        end
      elsif enemyHealthDeduction <= 0
        puts enemyHealthDeduction
        puts "Your #{attack} missed! #{$current_enemy[0][:name]} health still at #{$enemy_health}"
      end

    diceRoll = rand(1..100)
    playerHealthDeduction = diceRoll - $current_pokemon[0][:defense]
    enemyAttackRand = rand(0..2)
    enemy_attack = [$current_enemy[0][:attack1],$current_enemy[0][:attack2],$current_enemy[0][:attack3]]
    currentEnemyAttack = enemy_attack[enemyAttackRand]

      if playerHealthDeduction > 0 && i > 1
        $player_health -= playerHealthDeduction
        if $player_health < 0
          puts playerHealthDeduction
          puts "The #{$current_enemy[0][:name]}'s #{currentEnemyAttack} made a hit! Your #{$current_pokemon[0][:name]}'s health down to 0"
          i -= 2
        else
          puts playerHealthDeduction
          puts "The #{$current_enemy[0][:name]}'s #{currentEnemyAttack} made a hit! Your #{$current_pokemon[0][:name]}'s health down to #{$player_health}"
        end
      elsif playerHealthDeduction <= 0
        puts playerHealthDeduction
        puts "The #{$current_enemy[0][:name]}'s #{currentEnemyAttack} missed! Your #{$current_pokemon[0][:name]}'s health still at #{$player_health}"
      end
  end

  if ($player_health <= 0)
    puts "Your #{$current_pokemon[0][:name]} was defeated"
    $current_enemy.pop
    $current_pokemon.pop
    reset()
  elsif ($enemy_health <= 0)
    puts "Your #{$current_pokemon[0][:name]} defeated the #{$current_enemy[0][:name]}! He is now in your Pokedex! You can use him on future battles!"
    $current_pokemon[0][:xp] += 2
    $pokedex.push($current_enemy[0])
    $current_enemy.pop
    $enemyPool1.delete_at($current_enemy_index)
    xpCheck()
  end
end

def xpCheck()
  if $current_pokemon[0][:xp] == 10
    puts "Hooray! your #{$current_pokemon[0][:name]} has grown into a #{$current_pokemon[1][:name]}"
    puts "Its XP increased to #{$current_pokemon[1][:health]}, its attack increased to #{$current_pokemon[1][:attack_power]}, its defense increased to #{$current_pokemon[1][:defense]}}"
    $current_pokemon.shift
    newEnemy()
  else
    newEnemy()
  end
end


def reset()
  y = $pokedex.length
  if y == 2
    puts "you have lost your pokemon! Pick a new one: press 1 for #{$pokedex[0][:name]} and press 2 for #{$pokedex[1][:name]}!"
    resetAnswer = gets.chomp

    if resetAnswer == "1"
      if $pokedex[0][:name] == "bulbasaur"
        $current_pokemon.push($bulbasaur)
        newEnemy()
      elsif $pokedex[0][:name] == "charmander"
        $current_pokemon.push($charmander)
        newEnemy()
      elsif $pokedex[0][:name] == "squirtle"
        $current_pokemon.push($bulbasaur)
        newEnemy()
      end

    elsif resetAnswer =="2"

      if $pokedex[1][:name] == "bulbasaur"
        $current_pokemon.push($bulbasaur)
        newEnemy()
      elsif $pokedex[1][:name] == "charmander"
        $current_pokemon.push($charmander)
        newEnemy()
      elsif $pokedex[1][:name] == "squirtle"
        $current_pokemon.push($bulbasaur)
        newEnemy()
      end
    end
  elsif y == 1
    puts "you have lost your pokemon! You only have #{$pokedex[0][:name]} left! Dont lose him!"
    if $pokedex[0][:name] == "bulbasaur"
      $current_pokemon.push($bulbasaur)
      newEnemy()
    elsif $pokedex[0][:name] == "charmander"
      $current_pokemon.push($charmander)
      newEnemy()
    elsif $pokedex[0][:name] == "squirtle"
      $current_pokemon.push($bulbasaur)
      newEnemy()
    end
  end
end

def newEnemy()
  x = $enemyPool1
  y = x.length - 1
  i = rand(0...y)
  $current_enemy_index = i
  $current_enemy.push($enemyPool1[i])

  puts "A wild #{$current_enemy[0][:name]} has appeared! Do you wish to fight? (y/n)".colorize(:white)
   if gets.chomp.downcase == "y"
     battle()
   else
     puts "thanks for playing"
     exit
   end
end



puts "Hello there, please enter a name".colorize(:white)
player_name = gets.chomp

puts "Professor Oak: 'Hello #{player_name}. Choose your pokemon: press 1 for Bulbasaur, 2 for Charmander, 3 for Squirtle'".colorize(:white)
number = gets.chomp
$pokedex.push($bulbasaur[0])
$pokedex.push($charmander[0])
$pokedex.push($squirtle[0])
if number == "1"
  for pokemon in $bulbasaur
  $current_pokemon.push(pokemon)
  end
elsif number == "2"
  for pokemon in $charmander
  $current_pokemon.push(pokemon)
  end
elsif number == "3"
  for pokemon in $squirtle
  $current_pokemon.push(pokemon)
  end
end

# puts $current_pokemon[0]

puts "Professor Oak: 'Hello #{player_name}. Do you and #{$current_pokemon[0][:name]} wish to catch them all? (y/n)'".colorize(:white)
gets.chomp

newEnemy()
