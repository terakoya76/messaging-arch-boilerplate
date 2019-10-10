# frozen_string_literal: true

class ItemsController < ApplicationController
  before_action :set_item, only: %i[show update destroy]

  def index
    @item = Item.all

    render json: @item
  end

  # GET /item/1
  def show
    render json: @item
  end

  # POST /item
  def create
    @item = Item.new(item_params)

    if @item.save
      render json: @item, status: :created, location: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /item/1
  def update
    if @item.update(item)
      render json: @item
    else
      render json: @item.errors, status: :unprocessable_entity
    end
  end

  # DELETE /item/1
  def destroy
    @item.destroy
  end

  private

  def set_item
    @item = Item.find(params[:id])
  end

  def item_params
    params.fetch(:item, {})
  end
end
