# 1) Using a single puts statement build the following
# sentence using only data from the carl hash and the
# sagan array along with some string interpolation.
#
# We are a way for the cosmos to know itself.

carl  = {
          :toast => 'cosmos',
          :punctuation => [ ',', '.', '?' ],
          :words => [ 'know', 'for', 'we']
        }

sagan = [
          { :are => 'are', 'A' => 'a' },
          { 'waaaaaay' => 'way', :th3 => 'the' },
          'itself',
          { 2 => ['to']}
        ]

# Here is an example of building a setence out of array/hash pieces.
example = [ 'test', 'a', 'is']
time    = { :that => 'This', :period => '.'}
puts "#{time[:that]} #{example[2]} #{example[1]} #{example[0]}#{time[:period]}"


# Required Sentence
puts "#{carl[:words][2].capitalize} #{sagan[0][:are]} #{sagan[0]['A']} #{sagan[1]['waaaaaay']} #{carl[:words][1]} #{sagan[1][:th3]} #{carl[:toast]} #{carl[:words][0]} #{sagan[3][2][0]} #{sagan[2]}#{carl[:punctuation][1]}"

# 2) Create an array of hashes named ‘ghosts’ to hold the following information:
# Inky is 4 years old, loves reindeers and has 25 dollars in the bank.
# Pinky is 5 years old, loves garden tools and has 14 dollars in the bank.
# Blinky is 7 years old, loves ninjas and has 18.03 dollars in the bank.
# Clyde is 6 years old, loves yarn and has 0 dollars in the bank.

ghosts = [ { name: 'Inky', age: 4, loves: 'reindeers', net_worth: 25 },
            { name: 'Pinky', age: 5, loves: 'garden tools', net_worth: 14 },
            { name: 'Blinky', age: 7, loves: 'ninjas', net_worth: 18.03 },
            { name: 'Clyde', age: 6, loves: 'yarn', net_worth: 0 }
        ]

ghosts.each do |ghost|
  ghost_info  = "#{ghost[:name]} is #{ghost[:age]} years old, "
  ghost_info += "loves #{ghost[:loves]} and "
  ghost_info += "has #{ghost[:net_worth]} dollars in the bank."
  puts ghost_info
end


# 3) Write a script that uses the JSON provided by the dog.ceo API to print out a nicely formatted list of dog breeds and sub-breeds. 

require 'net/http'
require 'json'

url = 'https://dog.ceo/api/breeds/list/all'
uri = URI(url)
response = Net::HTTP.get(uri)
dog_breeds = JSON.parse(response) # Convert JSON data into Ruby data.

# Run the script and investigate the pretty print output to figure out how to access the array of returned dog breeds. Then replace the last line of the script with a nested loop that prints out all the dog breeds and associated sub-breeds. The output might look something like this:

dog_breeds['message'].each do |breed, sub_breeds|
  puts "* #{breed.capitalize}"
  sub_breeds.each do |sub_breed|
    puts "  * #{sub_breed.capitalize}"
  end
end

# 4) Using data from the city's open data set figure out how many of our trees may die now that the Emerald Ash Borer has been found here. In other words, how many Ash trees do we have in the city? 

# Load the subset of tree data first for testing
url = 'https://data.winnipeg.ca/resource/d3jk-hb6j.json?%24limit=306000'
uri = URI(url)
response = Net::HTTP.get(uri)
trees = JSON.parse(response)

# Count Ash trees
ash_tree_count = trees.count { |tree| tree['common_name'] && tree['common_name'].downcase.include?('ash') }

puts "Number of Ash trees: #{ash_tree_count}"