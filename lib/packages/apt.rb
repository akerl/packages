require 'open-uri'
require 'zlib'

module Packages
  ##
  # Support for apt repos
  class APT < Backend
    attr_reader :arch, :url

    def initialize(params = {})
      @arch = params[:arch] || 'amd64'
      @url = params[:url]
      load_repo
      @packages = load_packages
    end

    private

    def load_repo
      repo = open("#{@url}/Release") do |fh|
        Hash[fh.readlines[1..7].map { |x| x.strip.split ': ' }]
      end
      @distro = repo['Label']
      @version = repo['Version']
      @codename = repo['Codename']
      @components = repo['Components'].split
      return if repo['Architectures'].split.include? @arch
      fail 'specificed arch not found'
    end

    def load_packages
      @components.map do |comp|
        packages = open("#{@url}/#{comp}/binary-#{@arch}/Packages.bz2") do |fh|
        end
      end
    end
  end
end
