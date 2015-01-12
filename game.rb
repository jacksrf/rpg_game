# Team 4 the Win
# GOTTA CATCH EM ALL
#$ = {name: "", attack1: "", attack2: "", attack3: "", health: }

require "colorize"

$player_name = ""
$current_pokemon = []
$current_enemy = []
$pokedex = []

$bulbasaur = {name: "Bulbasaur", attack1: "Tackle", attack2: "growl", attack3: "Seed Bomb", health: 45, attack_power: 49, defense: 49}
$charmander= {name: "Charmander", attack1: "growl", attack2: "scratch", attack3: "Inferno", health: 39, attack_power: 52, defense: 43}
$squirtle = {name: "Squirtle", attack1: "Tackle", attack2: "Tail Whip", attack3: "Hydro Pump", health: 44, attack_power: 48, defense: 65}

$enemyPool1 =[{name: "Caterpie", attack1: "String Shot", attack2: "Tackle", attack3: "Bug Bite", health: 45, attack_power: 30, defense: 35},
 {name: "Metapod", attack1: "Harden", attack2: "Harden", attack3: "Harden", health: 50, attack_power: 20, defense: 55},
 {name: "Butterfree", attack1: "Confusion", attack2: "Poison Powder", attack3: "Quiver Dance", health: 60, attack_power: 45, defense: 50}]


def battle()
  $player_health = $current_pokemon[0][:health]
  $enemy_health = $current_enemy[0][:health]
  i = 2
  puts "POKEMON: you are battling #{$current_enemy[0][:name]}, its HP is #{$current_enemy[0][:health]}, Attack Power is #{$current_enemy[0][:attack_power]}, and Defense Power is #{$current_enemy[0][:defense]}".colorize(:red)

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
  elsif ($enemy_health <= 0)
    puts "Your #{$current_pokemon[0][:name]} defeated the #{$current_enemy[0][:name]}! He is now in your Pokedex! You can use him on future battles!"
    $pokedex.push($current_enemy[0])
    puts $pokedex
    $current_enemy.pop
    puts $current_enemy
  end
end





puts "Hello there, please enter a name".colorize(:white)
player_name = gets.chomp

puts "Professor Oak: 'Hello #{player_name}. Choose your pokemon: press 1 for Bulbasaur, 2 for Charmander, 3 for Squirtle'".colorize(:white)
number = gets.chomp
if number == "1"
  $current_pokemon.push($bulbasaur)
elsif number == "2"
  $current_pokemon.push($charmander)
elsif number == "3"
  $current_pokemon.push($squirtle)
end

puts "Professor Oak: 'Hello #{player_name}. Do you and #{$current_pokemon[0][:name]} wish to catch them all? (y/n)'".colorize(:white)

i = rand(0..2)
$current_enemy.push($enemyPool1[i])


if gets.chomp.downcase == "y"
  puts "A wild #{$current_enemy[0][:name]} has appeared! Do you wish to fight? (y/n)".colorize(:white)
 if gets.chomp.downcase == "y"
   battle()
 else
   puts "You are a goober"

 end

else
 exit
end
