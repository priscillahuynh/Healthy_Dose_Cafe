class LineItemsController < ApplicationController

    def create
        chosen_product = Product.find(params[:product_id])
        if !current_cart.line_items.include?(chosen_product)
            # if product isn't in the cart, add it to the cart
            @line_item = current_cart.line_items.build(product_id: chosen_product.id, cart_id: current_cart.id)
            @line_item.save
        else
            #if product is in the cart, find line_item and increment by one
            @line_item = current_cart.line_items.find_by(chosen_product)
            @line_item.quantity += 1
            @line_item.save
        end
            redirect_to product_path(chosen_product), flash: { notice: "Product added to cart" }
    end

end
