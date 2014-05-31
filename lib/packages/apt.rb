require 'open-uri'
require 'zlib'

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
      repo = open("#{@url}/Release" ) do |fh|
        Hash[fh.readlines[1..7].map { |x| x.strip.split ': ' }]
      end
      @distro = repo['Label']
      @version = repo['Version']
      @codename = repo['Codename']
      @components = repo['Components'].split
      unless repo['Architectures'].split.include? @arch
        fail 'specificed arch not found'
      end
    end

    def load_packages
      @components.map do |comp|
        packages = open("#{@url}/#{comp}/binary-#{@arch}/Packages.bz2") do |fh|
        end
      end
    end
  end
end

# packages = File.read('Packages').split("\n\n").map { |x| x.split("\n").map { |y| y.split(': ', 2) } }.map { |x| Hash[x] }.each_with_object({}) { |i, a| a[i.delete('Package')] = i }
