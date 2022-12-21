module Api
    module V1
        class ProgrammingLanguagesController < ApplicationController
            def index
                render json: ProgrammingLanguage.all
            end

            def show
                render json: ProgrammingLanguage.find(params[:id])
            end

            def create
                programming_language = ProgrammingLanguage.new(programming_language_params)
                
                if programming_language.save
                    render json: programming_language, status: :created # 201
                else
                    # binding.pry
                    render json: { errors: programming_language.errors.full_messages }, status: :bad_request # 400
                end
            end

            def destroy
                programming_language = ProgrammingLanguage.find(params[:id])
                
                if programming_language.destroy
                    render json: programming_language, status: :created # 201
                else
                    # binding.pry
                    render json: { errors: programming_language.errors.full_messages }, status: :bad_request # 400
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