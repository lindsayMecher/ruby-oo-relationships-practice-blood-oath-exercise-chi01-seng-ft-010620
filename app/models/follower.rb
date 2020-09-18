class Follower

    attr_accessor :name, :age, :life_motto

    @@all = []

    def initialize(name, age, life_motto)
        @name = name 
        @age = age 
        @life_motto = life_motto
        @@all << self
    end 

    def self.all 
        @@all
    end 

    def self.of_a_certain_age(age)
        self.all.select do |follower|
            follower.age >= age
        end 
    end 

    def blood_oaths
        BloodOath.all.select do |oath|
            oath.follower == self
        end 
    end 

    def cults 
        self.blood_oaths.map do |oath|
            oath.cult
        end 
    end 

    def join_cult(cult)
        if self.age < cult.minimum_age
           puts "You are too young to join our cult!"
        else 
            BloodOath.new(Time.now, cult, self)
        end 
    end 

    def my_cults_slogans 
        self.cults.map do |cult|
            p cult.slogan
        end 
    end 

    def self.most_active 
        self.sorted_by_cult_number.last
    end

    def self.sorted_by_cult_number
        self.all.sort_by do |follower|
            follower.cults.count
        end
    end 
    
    def self.top_ten 
        self.sorted_by_cult_number[0...10]
    end

    def fellow_cult_members
        # followers who are in the same cults 
        # first take all the cults im in
        # find a follower who is in all those same cults 
        followers = self.blood_oaths.map do |oath|
            oath.follower
        end
        followers.uniq
    end 

end 