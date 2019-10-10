class CustomersController < ApplicationController
  before_action :set_customer, only: [:show, :update, :destroy]

  def index
    @customer = Customer.all

    render json: @customer
  end

  # GET /customer/1
  def show
    render json: @customer
  end

  # POST /customer
  def create
    @customer = Customer.new(customer_parasm)

    if @customer.save
      render json: @customer, status: :created, location: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /customer/1
  def update
    if @customer.update(customer)
      render json: @customer
    else
      render json: @customer.errors, status: :unprocessable_entity
    end
  end

  # DELETE /customer/1
  def destroy
    @customer.destroy
  end

  private

  def set_customer
    @customer = Customer.find(params[:id])
  end

  def customer_params
    params.fetch(:customer, {})
  end
end
