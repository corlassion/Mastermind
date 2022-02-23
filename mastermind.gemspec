# frozen_string_literal: true

lib = File.expand_path("lib", __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require "mastermind/version"

Gem::Specification.new do |spec|
  spec.name    = "mastermind"
  spec.version = Mastermind::VERSION
  spec.authors = ["Stephen Michal"]
  spec.email   = ["corlassion@gmail.com"]

  spec.summary     = "Welcome to Mastermind, a codebreaking game!"
  spec.description = "In this game, you will attempt
to guess the code created by the computer. This code is 4 numbers long and made
up of digits from 1 to 6. After you guess a code, the game will provide you with
feedback on how close your code was to being correct. This feedback is composed
of two numbers. The first number indicates how many of your guessed numbers match
and are in the correct positions. The second number shows you how many of your
guessed numbers are in the code, but not the correct position. If you guess
correctly within 10 tries, you win!
Good luck!"

  spec.homepage = "https://github.com/corlassion/Mastermind"
  spec.license  = "MIT"

  spec.metadata["homepage_uri"]    = spec.homepage

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files         = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").select { |f| f.match(%r{^(lib)/}) }
  end
  spec.bindir        = "exe"
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ["lib"]

  # Dependencies that are required by the gem at runtime.
  # spec.add_dependency "<gem>>", "~> <version>"

  # Dependencies that are required by the gem during development. (testing, etc)
  spec.add_development_dependency "rake", "~> 12.0"
end
