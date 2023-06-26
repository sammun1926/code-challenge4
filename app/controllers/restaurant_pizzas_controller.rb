# app/controllers/restaurant_pizzas_controller.rb
class RestaurantPizzasController < ApplicationController
    def index
      restaurant_pizzas = RestaurantPizza.all
      render json: restaurant_pizzas, only: [:id, :price], include: { restaurant: { only: [:id, :name, :address] }, pizza: { only: [:id, :name, :ingredients] } }
    end
  
    def show
      restaurant_pizza = RestaurantPizza.find_by(id: params[:id])
      if restaurant_pizza
        render json: restaurant_pizza, only: [:id, :price], include: { restaurant: { only: [:id, :name, :address] }, pizza: { only: [:id, :name, :ingredients] } }
      else
        render json: { error: "RestaurantPizza not found" }, status: :not_found
      end
    end
  
    def destroy
      restaurant_pizza = RestaurantPizza.find_by(id: params[:id])
      if restaurant_pizza
        restaurant_pizza.destroy
        render json: {}, status: :no_content
      else
        render json: { error: "RestaurantPizza not found" }, status: :not_found
      end
    end
  end
  