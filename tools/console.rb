require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console
cult1 = Cult.new("CULT", "Chicago", 2020, "We are a dope AF cult")
cult2 = Cult.new("CULT", "Miami", 2020, "We only wear Gucci...")
cult3 = Cult.new("Bro cult", "Miami", 2020, "We only wear crocs...")
follower1 = Follower.new("Lindsay", 28, "yolo")
follower2 = Follower.new("Brad", 50, "noooooope")
follower3 = Follower.new("Duede", 90, "mannnnn")
oath1 = BloodOath.new(Time.now, cult1, follower1)
oath4 = BloodOath.new(Time.now, cult2, follower1)
oath2 = BloodOath.new(Time.now, cult1, follower2)
oath3 = BloodOath.new(Time.now, cult1, follower3)



binding.pry

puts "Mwahahaha!" # just in case pry is buggy and exits
