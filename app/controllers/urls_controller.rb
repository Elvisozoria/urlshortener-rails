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
        if params['amount']
            if params['amount'].to_i
                @urls = Url.all.sort_by {|task| task.clicked.to_i}.reverse![0..params['amount'].to_i]

                # @top_url = @url.limit(params['amount'].to_i)
                render json: @urls, status: :created
            else
                render json: 'error', status: :unprocessable_entity
            end
        else
            @urls = Url.all.sort_by {|task| task.clicked.to_i}.reverse![0..100]

            render json: @urls, status: :created
        end



    end
    

    private 
    def valid_url?(url)

    end


end
