begin
  require 'term/ansicolor'

  module Colorizer; extend Term::ANSIColor; end

  Pry.config.editor = "gvim"
  Pry.config.prompt = [proc{|obj, nest_level| "[#{nest_level}](#{obj}) >"}, proc{|obj, nest_level| Colorizer.on_blue {"[#{nest_level}](#{obj}) >"} }]
rescue LoadError
end
