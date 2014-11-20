class FormulasController < ApplicationController
  # GET /formulas
  # GET /formulas.json
  def index
    if params[:ingredients]
      @formulas = formulas_only_with params[:ingredients]
    else
      @formulas = Formula.all
    end
      render json: @formulas
  end

  def formula_params
    params.require(:formula).permit(:ingredients)
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
    params.require(:formula).permit(:nombre, :tiempo, :tipo, :descripcion, :id, portions_attributes: [:id, :ingredient_id, :_destroy])
  end

  def formulas_only_with(search_ingredients)
    # Turn the ingredients ids string intro integers.
    search_ingredients = search_ingredients.split(',').map(&:to_i)

    # Get the tables representation from the models and connect to them.
    ingredients = Ingredient.arel_table; Ingredient.connection
    portions    = Portion.arel_table;    Portion.connection
    formulas    = Formula.arel_table;    Formula.connection

    # Build the select_manager to get the ids of recipes with ingredients that
    # are NOT wanted.
   required = ingredients.project(formulas[:id]).
   where(ingredients[:id].in search_ingredients)
    required.join(portions).on(ingredients[:id].eq portions[:ingredient_id])
    required.join(formulas).on(portions[:formula_id].eq formulas[:id]).distinct

    # Get the recipes that don't appear in the group on non-wanted recipes
    Formula.where(Formula[:id].in required)

    unrequired = ingredients.project(formulas[:id])
      .where(ingredients[:id].not_in search_ingredients)
    unrequired.join(portions).on(ingredients[:id].eq portions[:ingredient_id])
    unrequired.join(formulas).on(portions[:formula_id].eq formulas[:id]).distinct

    # Get the recipes that don't appear in the group on non-wanted recipes
    Formula.where(Formula[:id].not_in unrequired)
  end
end
