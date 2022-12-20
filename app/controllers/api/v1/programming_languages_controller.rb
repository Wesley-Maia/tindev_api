module Api
    module V1
        class ProgrammingLanguagesController < ApplicationController
            def index
                render json: {successful: true}
            end
        end
    end
end