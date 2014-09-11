require 'json'
require 'namey'

n = 97

BALLOT_ID_CHARS0 = "ABCDFGHJKLMNPQRSTVWXZ".split('')
BALLOT_ID_CHARS = "BCDFGHJKLMNPQRSTVWXZ0123456789".split('')

def uniquifier
  2.times.map{BALLOT_ID_CHARS.sample}.join
end

def ballot_id
  BALLOT_ID_CHARS0.sample + 7.times.map{BALLOT_ID_CHARS.sample}.join
end

gen = Namey::Generator.new
candidates = 6.times.map { gen.name(:all) }
yesno = ["YES", "NO"]

ballots = n.times.map {
  {
  "ballot_id" => ballot_id,
  "uniquifier" => uniquifier,
  "candidate" => candidates.sample,
  "proposition" => yesno.sample
  }
}.sort_by { |ballot| ballot["ballot_id"] }

names = n.times.map { gen.name(:all) }.sort_by { |name| name.split(' ').reverse }

sample_ballot = ballots.sample
sample_ballot["uniquifiers"] = ([sample_ballot["uniquifier"]] + 12.times.map{ uniquifier }).uniq.take(6).shuffle

File.open("data/candidates.json", "w") {|f| f.write JSON.pretty_generate(candidates) }
File.open("data/ballots.json", "w") {|f| f.write JSON.pretty_generate(ballots) }
File.open("data/names.json", "w") {|f| f.write JSON.pretty_generate(names) }
File.open("data/sample_ballot.json", "w"){|f| f.write JSON.pretty_generate(sample_ballot) }
