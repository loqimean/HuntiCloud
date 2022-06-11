class BaseService
  def initialize
    raise "Cannot initialize an abstract BaseService class"
  end

  def call(url)
    RestClient.get(url)
  end
end
