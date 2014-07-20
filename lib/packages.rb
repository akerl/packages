##
# Normalizer for accessing package information
module Packages
  class << self
    attr_reader :backends
    @backends = []

    ##
    # Insert a helper .new() method for creating a new Packages object

    def new(*args)
      self::Packages.new(*args)
    end

    ##
    # Call to register additional backends
    def add_backend(pattern, object)
      @backends << object
    end
  end

  ##
  # Define the base Repo object
  class Backend
    attr_reader :distro, :version, :packages
  end

  ##
  # Define the base Package object
  class Package
    attr_reader :name, :version
  end
end
