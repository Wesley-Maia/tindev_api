module Api
    module V1
        class ProgrammingLanguagesController < ApplicationController
            def index
                render json: ProgrammingLanguage.all
            end

            def create
                # binding.pry
                programming_language = ProgrammingLanguage.new(programming_language_params)
                
                if programming_language.save
                    render json: programming_language
                end
            end

            private
            # Strong Parameters
            def programming_language_params
                params.require(:programming_language).permit(:name, :creator, :release_year)
            end
        end
    end
end