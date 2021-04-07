class UrlsController < ApplicationController 

    def redirect
        if params['shorten_url']
            if Url.find_by_shorten_url(params['shorten_url'])
                @url = Url.find_by_shorten_url(params['shorten_url'])
                @url.clicked = @url.clicked + 1
                @url.save
                redirect_to @url.original_url
                # render json: @url
            end
            
        end
        
    end
    
    def new
        if params['original_url']
            if Url.valid_url?(params['original_url'])

                @url= Url.create(original_url:params['original_url'])
                @url.encode
                if @url.save
                    @url.get_title
                    render json: @url.shorten_url, status: :created
                else
                    render json: @url.errors, status: :unprocessable_entity
                end
            end
        end

      
    end

    def top
        render json: @url, status: :created

    end
    

    private 
    def valid_url?(url)

    end


end
