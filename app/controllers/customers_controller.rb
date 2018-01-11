class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :edit, :update, :destroy]

  # GET /customers
  # GET /customers.json
  def index
    @customers = Customer.all
  end


  # GET /customers/1
  # GET /customers/1.json
  def show

    #copied from orders_control#show 1/9 15:17
    #line_items = @cutomer.order.line_items.includes(:pumpkin)
    #@li_pumpkin_pairs = line_items.map { |li| [li, li.pumpkin] }

    #@customer_item = order.line_items.includes(customer.name)
    #@customer_item = 'abc'
    #@customer_item02 = orders_url.test_variable

    #---------------------------


    if Order.find_by_id(params[:id]) != nil then
    #@li_pumpkin_pairs =  { li{'no'}, 'items' }

        order = Order.find(params[:id])

        line_items = order.line_items.includes(:pumpkin)
        @li_pumpkin_pairs = line_items.map { |li| [li, li.pumpkin] }

  else

    # http://uxmilk.jp/21695
    #@li_pumpkin_pairs = { {"amout" => 000, "price" => 000}, {"species" => 000, "price" => 000} }

    @li_pumpkin_pairs = nil

    #else

  end
  end


  # GET /customers/new
  def new
    @customer = Customer.new
  end

  # GET /customers/1/edit
  def edit
  end

  # POST /customers
  # POST /customers.json
  def create
    @customer = Customer.new(customer_params)

    respond_to do |format|
      if @customer.save
        format.html { redirect_to @customer, notice: 'Customer was successfully created.' }
        format.json { render :show, status: :created, location: @customer }
      else
        format.html { render :new }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /customers/1
  # PATCH/PUT /customers/1.json
  def update
    respond_to do |format|
      if @customer.update(customer_params)
        format.html { redirect_to @customer, notice: 'Customer was successfully updated.' }
        format.json { render :show, status: :ok, location: @customer }
      else
        format.html { render :edit }
        format.json { render json: @customer.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /customers/1
  # DELETE /customers/1.json
  def destroy
    @customer.destroy
    respond_to do |format|
      format.html { redirect_to customers_url, notice: 'Customer was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_customer
      @customer = Customer.find(params[:id])
      #@order = Order.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def customer_params
      params.require(:customer).permit(:name)
      #params.require(:order).permit(:customer_id)
    end

end
