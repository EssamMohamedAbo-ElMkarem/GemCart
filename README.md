# GemCart

GemCart is an e-commerce application built on Ruby on Rails.

## Installation

To run GemCart on your local machine, follow these steps:

1. **Clone the repository:**

   ```
   git clone https://github.com/EssamMohamedAbo-ElMkarem/GemCart.git
   cd GemCart
   ```

2. **Install dependencies:**

   ```
   bundle install
   ```

3. **Set up the database:**

   ```
   rails db:create
   rails db:migrate
   ```

4. **Start the server:**

   ```
   rails server
   ```

5. **Access GemCart:**

   Open your web browser and go to `http://localhost:3000`

## Routes

### Admin Dashboard

- **GET /admin/index**: Displays the admin dashboard.

### Admin Resources

- **GET /admin/orders**: Lists all orders.
- **GET /admin/orders/:id**: Shows details of a specific order.
- **POST /admin/orders/:id**: Updates an order.
- **DELETE /admin/orders/:id**: Deletes an order.

- **GET /admin/products**: Lists all products.
- **GET /admin/products/new**: Shows form for creating a new product.
- **POST /admin/products**: Creates a new product.
- **GET /admin/products/:id**: Shows details of a specific product.
- **PATCH/PUT /admin/products/:id**: Updates a product.
- **DELETE /admin/products/:id**: Deletes a product.

- **GET /admin/products/:product_id/stocks**: Lists all stocks for a product.
- **GET /admin/products/:product_id/stocks/new**: Shows form for creating new stock for a product.
- **POST /admin/products/:product_id/stocks**: Creates new stock for a product.
- **GET /admin/products/:product_id/stocks/:id**: Shows details of a specific stock.
- **PATCH/PUT /admin/products/:product_id/stocks/:id**: Updates a stock.
- **DELETE /admin/products/:product_id/stocks/:id**: Deletes a stock.

- **GET /admin/categories**: Lists all categories.
- **GET /admin/categories/new**: Shows form for creating a new category.
- **POST /admin/categories**: Creates a new category.
- **GET /admin/categories/:id**: Shows details of a specific category.
- **PATCH/PUT /admin/categories/:id**: Updates a category.
- **DELETE /admin/categories/:id**: Deletes a category.

### User Pages

- **GET /**: Shows the home page.
- **GET /cart**: Shows the user's cart.
- **POST /checkout**: Handles checkout process.
- **GET /success**: Shows success page after successful checkout.
- **GET /cancel**: Shows cancellation page if checkout is canceled.

### Other Routes

- **POST /webhooks**: Handles Stripe webhook events.

### System Health Check

- **GET /up**: Returns 200 if the app boots with no exceptions, otherwise 500.

---
