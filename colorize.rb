#!/usr/bin/env ruby

# A version not requiring the 'colorize' gem.

class String
    # colorization
    def colorize(color_code)
      "\e[#{color_code}m#{self}\e[0m"
    end
  
    def red
      colorize(31)
    end
  
    def green
      colorize(32)
    end
  
    def yellow
      colorize(33)
    end
  
    def blue
      colorize(34)
    end
  
    def pink
      colorize(35)
    end
  
    def magenta
        colorize(35)
    end

    def cyan
        colorize(36)
    end

    def light_blue
      colorize(36)
    end

    def white
        colorize(37)
    end
  end
  