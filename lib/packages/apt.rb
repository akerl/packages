require 'open-uri'

module Packages
  ##
  # Support for apt repos
  class APT < Repo
    attr_reader :arch, :url

    def initialize(params = {})
      @arch = params[:arch] || 'amd64'
      @url = params[:url]
      load_repo
      @packages = load_packages
    end

    private

    def load_repo
      repo = open(@url + 'Release' ) do |fh|
        Hash[fh.readlines[1..7].map { |x| x.strip.split ': ' }]
      end
      @distro = repo['Label']
      @version = repo['Version']
      @codename = repo['Codename']
      @components = repo['Components'].split
    end

    def load_packages
    end
  end
end

# packages = File.read('Packages').split("\n\n").map { |x| x.split("\n").map { |y| y.split(': ', 2) } }.map { |x| Hash[x] }.each_with_object({}) { |i, a| a[i.delete('Package')] = i }
