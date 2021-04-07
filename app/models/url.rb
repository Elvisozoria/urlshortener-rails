class Url < ApplicationRecord
    require "HTTParty"


    ALPHABET = "mdbwlVF8Nx26r0qXICWvGUhnKsoPkLzja1c7JQR9OfH5teB4SgpTMZDyuiA3YE".split(//)

    def encode
        i = self.id
        return ALPHABET[0] if i == 0
        s = ''
        base = ALPHABET.length
        while i > 0
            s << ALPHABET[i.modulo(base)]
            i /= base
        end
        s.reverse

        self.shorten_url = s.reverse
        self.save
    end

    def get_title
        
        Thread.new {
            html = HTTParty.get("https://elvisozoria.com").body
            self.title = html.scan(/<title>([^>]*)<\/title>/).last.first
            self.save
        }

    end

end
