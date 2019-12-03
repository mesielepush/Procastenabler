require_relative 'assets_loader.rb'

def move(x_pigeon, y_pigeon)
    @img[:background].draw(0, 0, 0)
    if Gosu::button_down? @keyboard[:kb_left]
        @img[:walk_left].draw(x_pigeon, y_pigeon, 0)
    elsif Gosu::button_down? @keyboard[:kb_right]
        @img[:walk_right].draw(x_pigeon, y_pigeon, 0)
    elsif x_pigeon == 500
        if Gosu::button_down? @keyboard[:space]
            @img[:rigth_click].draw(x_pigeon-40, y_pigeon-40, 0)
            @sounds[:click].play(volume = 0.9, speed = 1, looping = false)
        else
            @img[:pigeon_init].draw(x_pigeon, y_pigeon, 0)
        end
    elsif x_pigeon == 40
        if Gosu::button_down? @keyboard[:space]
            @img[:left_click].draw(x_pigeon-30, y_pigeon-40, 0)
            
        else
            @img[:pigeon_init].draw(x_pigeon, y_pigeon, 0)
        end    
    else
        @img[:pigeon_init].draw(x_pigeon, y_pigeon, 0)
    end
end

def velocity(x_pigeon)
    
    if x_pigeon < 40
        x_pigeon = 40
    elsif x_pigeon > 500
        x_pigeon = 500
    end
    if Gosu::button_down? @keyboard[:kb_left]
        x_pigeon -= 5
    elsif Gosu::button_down? @keyboard[:kb_right]
        x_pigeon +=5
    end
    if x_pigeon == 40 and Gosu::button_down? @keyboard[:space]
        @sounds[:click].play(volume=0.5)
    end
end
