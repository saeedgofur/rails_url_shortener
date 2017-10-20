class UrlsController < ApplicationController

	def index
    	@urls = Url.all
    end

    def show
    	@url = Url.find(params[:id])
    end

    def new
    	@url = Url.new
    end

    def create

    	@url = Url.new(url_params)
    	

    	if @url.save

    		@url.shorten
			# x = Url.find_by(long_url: url_params)
			# x.shortened_url = a
			# x.save
    		redirect_to @url 
    	else
    		render 'new'
    	end
    end

    def destroy
	    @url = Url.find(params[:id])
	    @url.destroy
	    redirect_to urls_path
	end

    private 
	def url_params
    	params.require(:url).permit(:long_url)
	end

end
