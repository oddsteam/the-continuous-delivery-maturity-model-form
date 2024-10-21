class HomeController < ApplicationController
    def index
        redirect_to evaluation_index_path
    end
end
