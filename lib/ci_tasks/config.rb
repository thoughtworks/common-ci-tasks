class Config
  def self.configuration
    Rails rescue nil ? :rails : :sinatra
  end
end
