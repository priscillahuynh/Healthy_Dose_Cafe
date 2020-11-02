class LineItemsController < ApplicationController

    def create
        chosen_product = Product.find(params[:product_id])
        if current_cart.products.include?(chosen_product)
            @line_item = current_cart.line_items.find_by(product_id: chosen_product.id)
            @line_item.quantity += 1
            @line_item.save
        else
            @line_item = current_cart.line_items.build(product_id: chosen_product.id, cart_id: current_cart.id)
            @line_item.save
        end
            redirect_to product_path(chosen_product), flash: { notice: "Product added to cart" }
    end

    def destroy
        @line_item = LineItem.find(params[:id])
        @line_item.destroy
        redirect_to cart_path(current_cart.id)
    end

    def add_quantity
        @line_item = LineItem.find(params[:id])
        @line_item.quantity += 1
        @line_item.save
        redirect_to cart_path(current_cart.id)
      end
      
      def reduce_quantity
        @line_item = LineItem.find(params[:id])
        if @line_item.quantity > 1
          @line_item.quantity -= 1
        end
        @line_item.save
        redirect_to cart_path(current_cart.id)
      end

end
