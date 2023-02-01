class Api::V1::ChamasController < ApplicationController
  # GET /chamas/1
  def show
    render json: @chama
  end

  # POST /chamas
  def create
    # @chama = Chama.new(chama_params)

    if @chama.save
      render json: @chama, status: :created, location: @chama
    else
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

  # DELETE /chamas/1
  def destroy
    @chama.destroy
  end

  def Login
        @chama = Chama.find_by(email: params[:email])
        if @chama&.authenticate(params[:password])
            token = jwt_encode(chama_id: @chama.id)
            render json: { token: token }, status: :ok
        else
            render json: { error: 'unauthorized' }, status: :unauthorized
        end

    end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_chama
      @chama = Chama.find(params[:id])
    end

    # Only allow a list of trusted parameters through.
    # def chama_params
    #   params.require(:chama).permit(:name, :reg_no, :logo_url)
    # end
end
