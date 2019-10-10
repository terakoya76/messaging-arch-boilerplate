# frozen_string_literal: true

class ShipmentsController < ApplicationController
  before_action :set_shipment, only: %i[show update destroy]

  def index
    @shipment = Shipment.all

    render json: @shipment
  end

  # GET /shipment/1
  def show
    render json: @shipment
  end

  # POST /shipment
  def create
    @shipment = Shipment.new(shipment_params)

    if @shipment.save
      render json: @shipment, status: :created, location: @shipment
    else
      render json: @shipment.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /shipment/1
  def update
    if @shipment.update(shipment)
      render json: @shipment
    else
      render json: @shipment.errors, status: :unprocessable_entity
    end
  end

  # DELETE /shipment/1
  def destroy
    @shipment.destroy
  end

  private

  def set_shipment
    @shipment = Shipment.find(params[:id])
  end

  def shipment_params
    params.fetch(:shipment, {})
  end
end
