class CompaniesController < ApplicationController
  before_action :set_company, only: [:show, :edit, :update, :destroy]

  # GET /companies
  # GET /companies.json
  def index
    @companies = Company.all
  end

  # GET /companies/1
  # GET /companies/1.json
  def show
  end

  # GET /companies/new
  def new
    @company = Company.new
  end

  # GET /companies/1/edit
  def edit
  end

  # POST /companies
  # POST /companies.json
  def create
	  the_params = company_params
	  the_params[:rating] = 0
	  the_params[:number_of_votes] = 0
    @company = Company.new(the_params)

    respond_to do |format|
      if @company.save
        format.html { redirect_to @company, notice: 'Company was successfully created.' }
        format.json { render :show, status: :created, location: @company }
      else
        format.html { render :new }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /companies/1
  # PATCH/PUT /companies/1.json
  def update
    respond_to do |format|
      if @company.update(company_params)
        format.html { redirect_to @company, notice: 'Company was successfully updated.' }
        format.json { render :show, status: :ok, location: @company }
      else
        format.html { render :edit }
        format.json { render json: @company.errors, status: :unprocessable_entity }
      end
    end
  end

  def vote
	set_company
	logger.debug(@company.number_of_votes)
	new_params = rate_param
	logger.debug(rate_param)
	new_params[:number_of_votes] = @company.number_of_votes+1
	new_rating = (@company.rating * @company.number_of_votes + new_params[:rating].to_i) / (new_params[:number_of_votes].to_i)
	new_params[:rating] = new_rating

	if @company.update(new_params)
		redirect_to @company
		#format.html { redirect_to @company, notice: 'Company was successfully updated.' }
		#format.json { render :show, status: :ok, location: @company }
	else
		redirect_to edit_company_path
		#format.html { render :edit }
		#format.json { render json: @company.errors, status: :unprocessable_entity }
	end
  end

  # DELETE /companies/1
  # DELETE /companies/1.json
  def destroy
    @company.destroy
    respond_to do |format|
      format.html { redirect_to companies_url, notice: 'Company was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_company
      @company = Company.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def company_params
      # params.fetch(:company, {})
		params.require(:company).permit(:name, :description, :logo, :rating)
    end

	def rate_param
		params.require(:company).permit(:rating)
	end
end
