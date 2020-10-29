class ProductsController < ApplicationController
    def new
        if find_category
            @product = @category.products.build
        else 
            @product = Product.new
        end
    end

    def create
        @category = Category.find_by(id: params[:product][:category_id])
        @product = @category.products.build(product_params)
        @product.save
        redirect_to category_products_path(@category) 
    end

    def index
        find_category
    end

    def show
        find_product    
    end

    def edit
        find_product
    end

    def update 
        find_product
        if @product.update(product_params)
        redirect_to product_path(@product)
        else 
        render  :new
        end
    end

    def destroy
        find_product
        @category = @product.category_id
        @product.destroy
        redirect_to category_products_path(@category), flash: { notice: "Product successfully deleted" }
    end

    private

    def product_params
        params.require(:product).permit(:name, :price, :category_name, :category_id)
    end

    def find_product
        @product = Product.find_by_id(params[:id])
    end

    def find_category
        @category = Category.find_by_id(params[:category_id])
    end

end
