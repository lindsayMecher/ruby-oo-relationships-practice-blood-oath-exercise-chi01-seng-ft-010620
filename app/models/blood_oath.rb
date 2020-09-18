class BloodOath 

    attr_accessor :initiation_date, :cult, :follower 

    @@all = [] 

    def initialize(initiation_date, cult, follower)
        @initiation_date = initiation_date
        @cult = cult 
        @follower = follower 
        @@all << self
    end 

    def self.all 
        @@all
    end

    def self.first_oath 
        self.all.first.follower
    end 


end 