# frozen_string_literal: true

class InvoicesController < ApplicationController
  before_action :set_invoice, only: %i[show update destroy]

  def index
    @invoice = Invoice.all

    render json: @invoice
  end

  # GET /invoice/1
  def show
    render json: @invoice
  end

  # POST /invoice
  def create
    @invoice = Invoice.new(invoice_params)

    if @invoice.save
      render json: @invoice, status: :created, location: @invoice
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /invoice/1
  def update
    if @invoice.update(invoice)
      render json: @invoice
    else
      render json: @invoice.errors, status: :unprocessable_entity
    end
  end

  # DELETE /invoice/1
  def destroy
    @invoice.destroy
  end

  private

  def set_invoice
    @invoice = Invoice.find(params[:id])
  end

  def invoice_params
    params.fetch(:invoice, {})
  end
end
