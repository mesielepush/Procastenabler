def load_audiovisual
    img = {
        background: Gosu::Image.new("images/cover.png"),
        
    }
    sounds = {
        #intro: Gosu::Song.new('intro.mp3'),
        enter: Gosu::Sample.new('sounds/game.mp3'),
        masking: Gosu::Song.new('sounds/masking_sound.mp3')
    }
    return img, sounds
end
