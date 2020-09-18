class Cult 

    attr_accessor :name, :location, :founding_year, :slogan

    @@all = []

    def initialize(name, location, founding_year, slogan)
        @name = name
        @location = location 
        @founding_year = founding_year
        @slogan = slogan
        @@all << self
    end 

    def recruit_follower(follower)
        BloodOath.new(Time.now, self, follower)
    end
    
    def self.all 
        @@all 
    end 

    def self.find_by_name(cult_name)
        self.all.find do |cult|
            cult.name == cult_name
        end 
    end 

    def self.find_by_location(location)
        self.all.select do |cult|
            cult.location == location
        end 
    end 

    def self.find_by_founding_year(year)
        self.all.select do |cult|
            cult.founding_year == year
        end
    end 

    def blood_oaths
        BloodOath.all.select do |oath|
            oath.cult == self
        end 
    end 

    def followers
        self.blood_oaths.map do |oath|
            oath.follower
        end 
    end 

    def cult_population
        # followers = self.blood_oaths.map do |oath|
        #     oath.follower
        # end 
        self.followers.count
    end 

    def average_age 
        age_array = self.followers.map do |follower|
            follower.age
        end 
        age_array.sum.to_f / age_array.count
    end
    
    def my_followers_mottos
        self.followers.map do |follower|
            p follower.life_motto
        end 
    end 

    def self.least_popular 
        in_order = self.all.sort_by do |cult|
            cult.followers
        end 
        in_order.first
    end 

    def self.most_common_location
        locations_hash = self.all.each_with_object({}) do |cult, hash|
            if hash[cult.location]
                hash[cult.location] << cult
            else 
                hash[cult.location] = [] 
                hash[cult.location] << cult
            end 
        end 
        sorted_locations = locations_hash.keys.sort_by do |city|
            locations_hash[city].count
        end 
        sorted_locations.last
    end

end 