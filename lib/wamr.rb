require 'open3'
require 'pathname'

require_relative 'wamr/version'
require_relative 'wamr/scanner'

module WAMR
  class Error < StandardError; end

  # convinience method so we can WAMR.run
  def self.run(directory = ".")
    Scanner.new(directory).scan
  rescue Error => e
    warn "WAMR Error: #{e.message}"
  rescue Interrupt
    puts "\nExiting..."
    exit 1
  end
end
