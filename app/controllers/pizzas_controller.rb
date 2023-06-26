# app/controllers/pizzas_controller.rb
class PizzasController < ApplicationController
    def index
      pizzas = Pizza.all
      render json: pizzas, only: [:id, :name, :ingredients]
    end
  
    def show
      pizza = Pizza.find_by(id: params[:id])
      if pizza
        render json: pizza, only: [:id, :name, :ingredients], include: { restaurants: { only: [:id, :name, :address] } }
      else
        render json: { error: "Pizza not found" }, status: :not_found
      end
    end
  
    def destroy
      pizza = Pizza.find_by(id: params[:id])
      if pizza
        pizza.destroy
        render json: {}, status: :no_content
      else
        render json: { error: "Pizza not found" }, status: :not_found
      end
    end
  end
  