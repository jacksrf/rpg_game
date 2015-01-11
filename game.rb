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

$zubat = {attack1: "", attack2: "", attack3: "", health: 100}
$mankey = {attack1: "", attack2: "", attack3: "", health: 100}
$jigglypuff = {attack1: "", attack2: "", attack3: "", health: 100}

def battle()
  puts "Whats your first attack? Choose (#{$current_pokemon[0][:attack1]}, #{$current_pokemon[0]['attack2']}, #{$current_pokemon[0]['attack3']})"

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


if gets.chomp.downcase == "y"

 puts "A wild Zubat has appeared! Do you wish to fight? (y/n)".colorize(:white)
$current_pokemon.push($zubat)
 if gets.chomp.downcase == "y"
   battle()
 else
   puts "You are a goober"

 end

else
 exit
end
