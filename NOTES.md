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