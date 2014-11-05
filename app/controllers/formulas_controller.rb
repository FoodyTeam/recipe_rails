class FormulasController < ApplicationController
  # GET /formulas
  # GET /formulas.json
  def index
    if params[:ingredients]
      ingredients_list = params[:ingredients]
      @ingredients = Ingredient.find(ingredients_list)
      portions = Portion.arel_table
      @formulas = Formula.joins(:portions).merge(Portion.where(portions[:ingredient_id].in(ingredients_list))).uniq
    else
      @formulas = Formula.all
    end
    respond_to do |format|
      format.html # index.html.erb
      format.json { render json: @formulas }
    end
  end

  # GET /formulas/1
  # GET /formulas/1.json
  def show
    @formula = Formula.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @formula }
    end
  end

  # GET /formulas/new
  # GET /formulas/new.json
  def new
    @formula = Formula.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @formula }
    end
  end

  # GET /formulas/1/edit
  def edit
    @formula = Formula.find(params[:id])
  end

  # POST /formulas
  # POST /formulas.json
  def create
    @formula = Formula.new(formula_params)

    respond_to do |format|
      if @formula.save
        format.html { redirect_to @formula, notice: 'Formula was successfully created.' }
        format.json { render json: @formula, status: :created, location: @formula }
      else
        format.html { render action: "new" }
        format.json { render json: @formula.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /formulas/1
  # PUT /formulas/1.json
  def update
    @formula = Formula.find(params[:id])

    respond_to do |format|
      if @formula.update_attributes(formula_params)
        format.html { redirect_to @formula, notice: 'Formula was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @formula.errors, status: :unprocessable_entity }
      end
    end
  end


  # DELETE /formulas/1
  # DELETE /formulas/1.json
  def destroy
    @formula = Formula.find(params[:id])
    @formula.destroy

    respond_to do |format|
      format.html { redirect_to formulas_url }
      format.json { head :no_content }
    end
  end

  private
  def formula_params
    params.require(:formula).permit(:nombre, :tiempo, :tipo, :descripcion, :id)
  end
end
