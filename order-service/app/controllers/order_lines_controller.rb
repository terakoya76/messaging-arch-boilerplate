class OrderLinesController < ApplicationController
  before_action :set_order_line, only: [:show, :update, :destroy]

  def index
    @order_line = OrderLine.all

    render json: @order_line
  end

  # GET /order_line/1
  def show
    render json: @order_line
  end

  # POST /order_line
  def create
    @order_line = OrderLine.new(order_line_params)

    if @order_line.save
      render json: @order_line, status: :created, location: @order_line
    else
      render json: @order_line.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /order_line/1
  def update
    if @order_line.update(order_line)
      render json: @order_line
    else
      render json: @order_line.errors, status: :unprocessable_entity
    end
  end

  # DELETE /order_line/1
  def destroy
    @order_line.destroy
  end

  private

  def set_order_line
    @order_line = OrderLine.find(params[:id])
  end

  def order_line_params
    params.fetch(:order_line, {})
  end
end
