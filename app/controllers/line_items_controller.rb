class LineItemsController < ApplicationController

    def create
        chosen_product = Product.find(params[:product_id])
        if !current_cart.line_items.include?(chosen_product) # FIX THIS!
            @line_item = current_cart.line_items.find_by(product_id: chosen_product.id) # DO NOT CHANGE THIS LINE
            @line_item.quantity += 1
            @line_item.save
        else
            @line_item = current_cart.line_items.build(product_id: chosen_product.id, cart_id: current_cart.id)
            @line_item.save
        end
            redirect_to product_path(chosen_product), flash: { notice: "Product added to cart" }
    end

end
