# frozen_string_literal: true

class InvoiceLinesController < ApplicationController
  before_action :set_invoice_line, only: %i[show update destroy]

  def index
    @invoice_line = InvoiceLine.all

    render json: @invoice_line
  end

  # GET /invoice_line/1
  def show
    render json: @invoice_line
  end

  # POST /invoice_line
  def create
    @invoice_line = InvoiceLine.new(invoice_line_params)

    if @invoice_line.save
      render json: @invoice, status: :created, location: @invoice_line
    else
      render json: @invoice_line.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /invoice_line/1
  def update
    if @invoice_line.update(invoice_line)
      render json: @invoice_line
    else
      render json: @invoice_line.errors, status: :unprocessable_entity
    end
  end

  # DELETE /invoice_line/1
  def destroy
    @invoice_line.destroy
  end

  private

  def set_invoice_line
    @invoice_line = InvoiceLine.find(params[:id])
  end

  def invoice_line_params
    params.fetch(:invoice_line, {})
  end
end
