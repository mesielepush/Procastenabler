require_relative 'assets_loader.rb'

def intro_scene()
    @img[:cover].draw(0, 0, 0)
    if Gosu::button_down? @keyboard[:space]
        @sounds[:enter].play
        @sounds[:on].play(volume = 1, speed = 1, looping = false)
        @initial_scene = true
        @intro = nil
    end
end

def initial()
    @img[:off].draw(0, 0, 0)
    @img[:off_pigeon].draw( 350, @y_pigeon_intro, 0)
    
    if @y_pigeon_intro > 198
        if Gosu::button_down? @keyboard[:kb_left] || @keyboard[:kb_rigth]
            @Session = true
            @initial_scene = nil
        end
    end
end

def opening()
    @img[:off].draw(0, 0, 0)
    @img[:off_pigeon].draw( 350, @y_pigeon_intro, 0)
    
    if @y_pigeon_intro > 198
        if Gosu::button_down? @keyboard[:kb_left] || @keyboard[:kb_rigth]
            @Session = true
            @initial_scene = nil
        end
    end
end
