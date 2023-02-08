class Api::V1::ChamasController < ApplicationController

  def index
    @chamas = Chama.all
  end

  # GET /chamas/1
  def show
    render json: @chama
  end

  # POST /chamas
  def create
    # binding.pry
    @chama = Chama.new(chama_params)
    @chama.admin = @current_user
    if @chama.save
      render json: @chama, status: :created
    else
      # binding.pry
      render json: @chama.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /chamas/1
  def update
    if @chama.update(chama_params)
      render json: @chama
    else
      render json: @chama.errors, status: :unprocessable_entity
    end
  end

  def destroy
    @chama.destroy
  end



  private
    def set_chama
      @chama = Chama.find(params[:id])
    end

    def chama_params
      params.require(:chama).permit(:name, :reg_no, :username, :logo_url)
    end
end
