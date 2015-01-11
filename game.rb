# Team 4 the Win
# GOTTA CATCH EM ALL
#$ = {name: "", attack1: "", attack2: "", attack3: "", health: }

require "colorize"

$player_name = ""
$current_pokemon = []
$current_enemy = []

$bulbasaur = {name: "Bulbasaur", attack1: "Tackle", attack2: "growl", attack3: "Seed Bomb", health: 45, attack_power: 49, defense: 49}
$charmander= {name: "Charmander", attack1: "growl", attack2: "scratch", attack3: "Inferno", health: 39, attack_power: 52, defense: 43}
$squirtle = {name: "Squirtle", attack1: "Tackle", attack2: "Tail Whip", attack3: "Hydro Pump", health: 44, attack_power: 48, defense: 65}

$enemyPool1 =[{name: "Caterpie", attack1: "String Shot", attack2: "Tackle", attack3: "Bug Bite", health: 45, attack_power: 30, defense: 35},
 {name: "Metapod", attack1: "Harden", attack2: "Harden", attack3: "Harden", health: 50, attack_power: 20, defense: 55},
 {name: "Butterfree", attack1: "Confusion", attack2: "Poison Powder", attack3: "Quiver Dance", health: 60, attack_power: 45, defense: 50}]


def battle()
  puts "POKEMON: you are battleing #{$current_enemy[0][:name]}, its HP is #{$current_enemy[0][:health]}, Attack Power is #{$current_enemy[0][:attack_power]}, and Defense Power is #{$current_enemy[0][:defense]}".colorize(:red)
  puts "Whats your first attack? Choose (#{$current_pokemon[0][:attack1]}, #{$current_pokemon[0][:attack2]}, #{$current_pokemon[0][:attack3]})".colorize(:red)

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

i = rand(3)
$current_enemy.push($enemyPool1[i-1])


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
