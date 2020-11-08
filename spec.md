Specs:

 [x] Using Ruby on Rails for the project
 [x] Include at least one has_many relationship (x has_many y; e.g. User has_many Recipes)
    User has_many :orders, Product has_many line_items, Category has_many products
 [x] Include at least one belongs_to relationship (x belongs_to y; e.g. Post belongs_to User)
    Order belongs_to user, line_items belongs_to product, products belong_to category
 [x] Include at least one many-to-many relationship (x has_many y through z, y has_many x through z; e.g.
    Product has_many carts through line_items. cart has_many products through line_items
 [x] The "through" part of the has_many through includes at least one user submittable attribute, that is   
    to say, some attribute other than its foreign keys that can be submitted by the app's user (attribute_name e.g. ingredients.quantity) 
    LineItem :quantity and :special_request
 [x] Include reasonable validations for simple model objects (list of model objects with validations e.g. 
    User - username must be unique and password must be more than 8 characters
    Product - must have a name, category, and price
 [x] Include a class level ActiveRecord scope method (model object & class method name and URL to see the 
    working feature e.g. User.most_recipes URL: /users/most_recipes) 
*******
 [x] Include signup (how e.g. Devise) 
 [x] Include login (how e.g. Devise)
 [x] Include logout (how e.g. Devise)
 [x] Include third party signup/login (how e.g. Devise/OmniAuth) - Facebook
 [x] Include nested resource show or index (URL e.g. users/2/recipes) - menu/1/products
 [x] Include nested resource "new" form (URL e.g. recipes/1/ingredients/new) menu/1/products/new
 [x] Include form display of validation errors (form URL e.g. /recipes/new) 

    Confirm:

 [x] The application is pretty DRY
 [x] Limited logic in controllers
 [x] Views use helper methods if appropriate 
 [x] Views use partials if appropriate