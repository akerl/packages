##
# Normalizer for accessing package information
module Packages
  ##
  # Define the base Repo object
  class Repo
    attr_reader :distro, :version, :packages
  end

  class Package
    attr_reader :name, :version
  end
end
