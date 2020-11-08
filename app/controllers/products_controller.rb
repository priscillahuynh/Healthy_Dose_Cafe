class ProductsController < ApplicationController
    before_action :find_product, only: [:show, :edit, :update, :destroy]
    before_action :find_category, only: [:index]


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
        @product.name.capitalize!
        if @product.save
            @product.image.purge
            @product.image.attach(params[:product][:image])
        redirect_to category_products_path(@category), flash: { alert: "Product successfully added" }
        else 
            render :new
        end
    end

    def index
    end

    def show   
    end

    def edit
    end

    def update 
        if @product.update(product_params)
            @product.image.purge
            @product.image.attach(params[:product][:image])
            @category = @product.category_id
            redirect_to category_products_path(@category), flash: { alert: "Product successfully updated" }
        else 
            render  :edit
        end
    end

    def destroy
        @category = @product.category_id
        @product.destroy
        redirect_to category_products_path(@category), flash: { alert: "Product successfully deleted" }
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
