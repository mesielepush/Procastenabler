def load_audiovisual
    img = {
        cover: Gosu::Image.new("images/cover.png"),
        off: Gosu::Image.new('images/off.png'),
        background: Gosu::Image.new('images/back.png'),
        to_enter: Gosu::Image.new('images/enter_for_enter.png'),
        off_pigeon: Gosu::Image.new('images/off_p.png'),
        pigeon_init: Gosu::Image.new('images/PINI.png'),
        walk_right: Gosu::Image.new('images/PDER.png'),
        walk_left: Gosu::Image.new('images/PIZQ.png'),
        rigth_click: Gosu::Image.new('images/P2Pellet.png'),
        left_click: Gosu::Image.new('images/P1Pellet.png'),


    }
    sounds = {
        #intro: Gosu::Song.new('intro.mp3'),
        enter: Gosu::Sample.new('sounds/coin.mp3'),
        masking: Gosu::Song.new('sounds/masking_sound.mp3'),
        on: Gosu::Sample.new('sounds/on.mp3'),
        click: Gosu::Sample.new('sounds/click.mp3')
    }
    return img, sounds
end
def load_metadata
    key =  {kb_left: Gosu::KbLeft,
            kb_right: Gosu::KbRight,
            gp_left: Gosu::GpLeft,
            gp_right: Gosu::GpRight,
            enter: Gosu::KB_RETURN,
            space: Gosu::KB_SPACE,
            m_left: Gosu::MS_LEFT,
            m_right: Gosu::MS_RIGHT
            }
    
    return key
end