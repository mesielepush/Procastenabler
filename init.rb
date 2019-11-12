require 'gosu'
require_relative 'assets_loader'
class Game < Gosu::Window
    attr_writer :somthing
    
    def initialize
        super 800, 600
        self.caption = 'Poscastenabler'

        @keyboard = load_metadata
        @img, @sounds = load_audiovisual
        @sounds[:enter].play(volume = 0.3)
        @sounds[:on].play(volume = 0.3)
        @sounds[:masking].volume = 0.8
        @sounds[:masking].play(true)
        
        @y_pigeon_intro = 700
        @x_pigeon = 320
        @y_pigeon = 280
        @intro = true 
        @initial_scene = false
        @Session = false
    end

    

    def update

       if @initial_scene == true
            @y_pigeon_intro -= 5
            if @y_pigeon_intro < 280
                @y_pigeon_intro = 280
            end
        end
        if @Session == true
            if @x_pigeon < 40
                
                @x_pigeon = 40
            
            elsif @x_pigeon > 500
                @x_pigeon = 500
            end

            if Gosu::button_down? @keyboard[:kb_left]
                @x_pigeon -= 5
                
            elsif Gosu::button_down? @keyboard[:kb_right]
                @x_pigeon +=5
                
            end

            if @x_pigeon == 40 and Gosu::button_down? @keyboard[:space]
                @sounds[:click].play(volume=0.5)
                       
                
            end
        end

    end
    def draw
        if @intro == true
            @img[:cover].draw(0, 0, 0)
            if Gosu::button_down? @keyboard[:space]
                @sounds[:enter].play
                @sounds[:on].play(volume = 1, speed = 1, looping = false)
                @initial_scene = true
                @intro = nil
            end
        end
        
        if @initial_scene == true
            @img[:off].draw(0, 0, 0)
            @img[:off_pigeon].draw( 350, @y_pigeon_intro, 0)
            
            if @y_pigeon_intro > 198
                if Gosu::button_down? @keyboard[:kb_left] || @keyboard[:kb_rigth]
                    @Session = true
                    @initial_scene = nil
                end
            end
        end

        if @Session == true
            puts @x_pigeon
            
            @img[:background].draw(0, 0, 0)
            
            if Gosu::button_down? @keyboard[:kb_left]
                @img[:walk_left].draw(@x_pigeon, @y_pigeon, 0)
            elsif Gosu::button_down? @keyboard[:kb_right]
                @img[:walk_right].draw(@x_pigeon, @y_pigeon, 0)
            elsif @x_pigeon == 500
                if Gosu::button_down? @keyboard[:space]
                    @img[:rigth_click].draw(@x_pigeon-40, @y_pigeon-40, 0)
                    @sounds[:click].play(volume = 0.9, speed = 1, looping = false)
                else
                    @img[:pigeon_init].draw(@x_pigeon, @y_pigeon, 0)
                end
            elsif @x_pigeon == 40
                if Gosu::button_down? @keyboard[:space]
                    @img[:left_click].draw(@x_pigeon-30, @y_pigeon-40, 0)
                    
                else
                    @img[:pigeon_init].draw(@x_pigeon, @y_pigeon, 0)
                end    
            else
                @img[:pigeon_init].draw(@x_pigeon, @y_pigeon, 0)
            end
            
        end
    end
end
Game.new.show