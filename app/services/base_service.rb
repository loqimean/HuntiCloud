class BaseService
  def initialize
    raise "Cannot initialize an abstract BaseService class"
  end

  def call(url)
    raise 'Not given url' if url.nil?

    RestClient.get(url)
  end
end
