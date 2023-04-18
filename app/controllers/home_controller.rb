# frozen_string_literal: true

class HomeController < ApplicationController
  # GET /: Retornar uma mensagem "REST Back-end Challenge 20201209 Running"
  def index
    render json: { message: 'REST Back-end Challenge 20201209 Running' }
  end
end
