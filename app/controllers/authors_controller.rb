class AuthorsController < ApplicationController
    def new
    end

    def create
        @author = Author.new(params[:author])
    end
end
