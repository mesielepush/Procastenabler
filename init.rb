require 'gosu'
require_relative 'assets_loader'
require_relative 'scenes.rb'


class Game < Gosu::Window
    attr_writer :somthing
    
    def initialize
        super 800, 600
        self.caption = 'PoscastEnabler'
        
        @keyboard = load_metadata
        @img, @sounds = load_audiovisual
        @sounds[:enter].play(volume = 0.3)
        @sounds[:on].play(volume = 0.3)
        @sounds[:masking].volume = 0.8
        @sounds[:masking].play(true)
        @font = Gosu::Font.new(self, Gosu::default_font_name, 15)
        @y_pigeon_intro = 700
        @x_pigeon = 320
        @y_pigeon = 280
        @intro = true 
        @initial_scene = false
        @Session = false
        @time = Gosu.milliseconds/1000
        
    end

    

    def update
        @time = Gosu.milliseconds/1000
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
            intro_scene()
        end
        
        if @initial_scene == true
            opening()
        end

        if @Session == true
            puts @x_pigeon
            @img[:background].draw(0, 0, -5)
            @font.draw(@time.to_s, 390, 235, 1, 1.0, 1.0, Gosu::Color::RED)
            if Gosu::button_down? @keyboard[:kb_left]
                @img[:walk_left].draw(@x_pigeon, @y_pigeon, 0)
            elsif Gosu::button_down? @keyboard[:kb_right]
                @img[:walk_right].draw(@x_pigeon, @y_pigeon, 0)
            elsif @x_pigeon == 500
                if Gosu::button_down? @keyboard[:space]
                    @img[:rigth_click].draw(@x_pigeon-40, @y_pigeon-40, 0)
                    @sounds[:click].play(volume = 0.9, speed = 1, looping = false)
                    @img[:bder_click].draw(669, 282, -2)

                else
                    @img[:pigeon_init].draw(@x_pigeon, @y_pigeon, 0)
                end
            elsif @x_pigeon == 40
                if Gosu::button_down? @keyboard[:space]
                    @img[:left_click].draw(@x_pigeon-30, @y_pigeon-40, 0)
                    @img[:bizq_click].draw(45, 282, -2)
                    
                    
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