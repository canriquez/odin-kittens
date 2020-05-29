class KittensController < ApplicationController

    def index
        @kittens = Kitten.all
    end

    def show
        @kitten = Kitten.find(params[:id])
    end

    def new
        @kitten = Kitten.new
    end

    def create
        @kitten = Kitten.new(kitten_params)
        if @kitten.save
          redirect_to root_path, notice: "Kitten #{@kitten.name} has been created"
          # I redirect to the index of courses by design instead of tipically redirect to the new created course
        else
          render :new
        end
      end
    

    def edit
        @kitten = Kitten.find(params[:id])
    end

    def update
        if @kitten.update_attributes(kitten_params) # if we succeed to update
          redirect_to root_path # then we show the update changes implemented
        else
          render :edit
        end
    end
    
    def destroy
        @kitten = Kitten.find(params[:id])
        @kitten.destroy
        redirect_to root_path, notice: "Kitten #{@kitten.name} was  eliminated."
    end

    
    private

    def kitten_params
        params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end


end