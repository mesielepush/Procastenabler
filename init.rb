require 'gosu'
require_relative 'assets_loader'
class Game < Gosu::Window
    attr_writer :somthing
    
    def initialize
        super 800, 600
        self.caption = 'Poscastenabler'

        #@keyboard, @schedules = load_metadata
        @img, @sounds = load_audiovisual
        @sounds[:enter].play(volume = 0.1)
        @intro = true 
    end

    

    def update
       
    end
    def draw
        if @intro == true
            
            @img[:background].draw(0, 0, 0)
        end
        if @Session == false
        end
    end
end
Game.new.show