USER
Has_many :orders
has_one  :cart

username: string
Password_digest :string
Admin :boolean default:false
------------------------------------------------------
CATEGORY
Has_many :products
name: string
------------------------------------------------------
PRODUCT
Belongs_to :category
Has_many :line_items
Has_many :carts :through :line_items
name: string
price :decimal(7,2)
Category_id :integer
------------------------------------------------------
CART
Belongs_to :user
Has_many :line_items
Has_many :products :through :line_items
User_id :integer
------------------------------------------------------
LINE_ITEM
Belongs_to :product
Belongs_to :cart
Belongs_to :order
Quantity :integer default: 1
Special request :text
Product_id :integer
Cart_id: integer
Order_id :integer
------------------------------------------------------
ORDER
Belongs_to :user
Has_many :line_items
Total: decimal
User_id :integer
------------------------------------------------------
ROUTES

get '/' 
welcome page
    sign up or login links

once logged in, user is directed to menu page (categories#show) '/menu'
    Juices --> link to individual category to view list of products (category_products_path)  '/menu/juices' 
    Breakfast 
    Lunch etc
     
'/menu/juices ('/menu/:category_id/products') // products#show
    Product name, price, and image --> link to category_product_path ('/menu/juices/products/:id')
                                        display product, name, price, descrption and image
                                        button to 'add item to cart' 
                                            (-update cart with 1 of selected item
                                             -alert user item added to cart
                                             -re-render product show page)
                                        IF ADMIN 
                                        "Add new product" to 'Juices' new_category_product_path --> '/menu/juices/
                                                            products/new 
                                        "Edit product" edit_category_product_path '/menu/juices/products/2/edit
                                            render form with existing product name, price, description, image 
                                                button to "update product" 
                                                    --> redirect to product show page
                                                or "delete product"
                                                    --> redirect to menu/juices/1


To do: 
-admin profile view: scope method(s)
-style flash messages
-partials for new and edit views
-add products with images
-style home page
-video walkthrough
-blog post

