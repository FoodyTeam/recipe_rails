class PortionsController < ApplicationController
  # GET /portions
  # GET /portions.json
  def index
    @portions = Portion.where("formula_id like '%#{params[:formula_id]}%'")
    @portions = Portion.where("ingredient_id like '%#{params[:ingredient_id]}%'")

    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @portions }
    end
  end

  # GET /portions/1
  # GET /portions/1.json
  def show
    @portion = Portion.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @portion }
    end
  end

  # GET /portions/new
  # GET /portions/new.json
  def new
    @portion = Portion.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @portion }
    end
  end

  # GET /portions/1/edit
  def edit
    @portion = Portion.find(params[:id])
  end

  # POST /portions
  # POST /portions.json
  def create
    @portion = Portion.new(portion_params)

    respond_to do |format|
      if @portion.save
        format.html { redirect_to @portion, notice: 'Portion was successfully created.' }
        format.json { render json: @portion, status: :created, location: @portion }
      else
        format.html { render action: "new" }
        format.json { render json: @portion.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /portions/1
  # PUT /portions/1.json
  def update
    @portion = Portion.find(params[:id])

    respond_to do |format|
      if @portion.update_attributes(portion_params)
        format.html { redirect_to @portion, notice: 'Portion was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @portion.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /portions/1
  # DELETE /portions/1.json
  def destroy
    @portion = Portion.find(params[:id])
    @portion.destroy

    respond_to do |format|
      format.html { redirect_to portions_url }
      format.json { head :no_content }
    end
  end

  private
  def portion_params
    params.require(:portion).permit(:formula_id, :ingredient_id)
  end
end
