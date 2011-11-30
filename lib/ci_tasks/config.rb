module CiTasks
  class Config
    def self.configuration
      rails? ? :rails : :sinatra
    end

    def self.rails?
      Rails rescue nil
    end
    
  end
end
