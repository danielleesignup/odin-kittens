class KittensController < ApplicationController
    before_action :set_kitten, only: [:show, :edit, :update, :destroy]

    def index
      @kittens = Kitten.all
    end
  
    def show
    end
  
    def new
      @kitten = Kitten.new
    end
  
    def create
        @kitten = Kitten.new(kitten_params)
      
        if @kitten.save
          puts "SAVE BLOCK TRIGGERED!!!!!!!"
          puts @kitten
          flash[:success] = "Congratulations! Kitten was successfully saved"
          redirect_to @kitten
        else
          puts "SAVE FAILED!!!!!!!"
          puts @kitten
          
          flash.now[:error] = 'Oops! There was an error in the form. Please correct it.'
          render :new
        end
      end
      
    def edit
    end
  
    def update
      if @kitten.update(kitten_params)
        flash[:success] = "Congratulations! Kitten was successfully updated."
        redirect_to @kitten
      else
        flash.now[:error] = "Oops! There was an error in the form. Please correct it."
        render :edit
      end
    end
  
    def destroy
      @kitten.destroy
      flash[:success] = "Congratulations! Kitten was successfully destroyed."
      redirect_to kittens_path
    end
  
    private
  
    def set_kitten
      @kitten = Kitten.find(params[:id])
    end
  
    def kitten_params
      params.require(:kitten).permit(:name, :age, :cuteness, :softness)
    end
  end

