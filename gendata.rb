require 'json'
require 'namey'

n = 97

BALLOT_ID_CHARS0 = "ABCDFGHJKLMNPQRSTVWXZ".split('')
BALLOT_ID_CHARS = "BCDFGHJKLMNPQRSTVWXZ0123456789".split('')

gen = Namey::Generator.new
candidates = 6.times.map { gen.name(:all) }
yesno = ["YES", "NO"]


ballots = n.times.map {
  {
  "ballot_id" => BALLOT_ID_CHARS0.sample + 9.times.map{BALLOT_ID_CHARS.sample}.join,
  "candidate" => candidates.sample,
  "proposition" => yesno.sample
  }
}.sort_by { |ballot| ballot["ballot_id"] }

names = n.times.map { gen.name(:all) }.sort_by { |name| name.split(' ').reverse }

File.open("data/ballots.json", "w") {|f| f.write JSON.dump(ballots) }
File.open("data/names.json", "w") {|f| f.write JSON.dump(names) }
