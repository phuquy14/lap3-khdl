-- Tạo bảng Khách hàng (customers)
CREATE TABLE customers (
    customer_id SERIAL PRIMARY KEY,
    full_name VARCHAR(100) NOT NULL,
    phone_number VARCHAR(15) UNIQUE NOT NULL,
    address VARCHAR(255)
);

-- Tạo bảng Sản phẩm (products)
CREATE TABLE products (
    product_id SERIAL PRIMARY KEY,
    product_name VARCHAR(150) NOT NULL,
    price NUMERIC(10, 2) NOT NULL CHECK (price > 0),
    stock_quantity INT NOT NULL DEFAULT 0
);

-- Nhập 10 khách hàng (Đảm bảo có khách hàng chứa chữ lót "Văn")
INSERT INTO customers (full_name, phone_number, address) VALUES
('Nguyễn Văn An', '0901234567', 'Hà Nội'),
('Trần Thị Bích', '0912345678', 'Hà Nội'),
('Lê Văn Cường', '0923456789', 'Đà Nẵng'),
('Phạm Thu Hà', '0934567890', 'TP HCM'),
('Hoàng Văn Em', '0945678901', 'Hải Phòng'),
('Đặng Thái Sơn', '0956789012', 'Cần Thơ'),
('Bùi Thị Ngọc', '0967890123', 'Hà Nội'),
('Đỗ Văn Hùng', '0978901234', 'Đà Nẵng'),
('Hồ Thanh Trúc', '0989012345', 'TP HCM'),
('Ngô Văn Toàn', '0990123456', 'Hà Nội');

-- Nhập 20 sản phẩm siêu thị Mini
INSERT INTO products (product_name, price, stock_quantity) VALUES
('Sữa tươi Vinamilk 1L', 35000, 50),
('Mì Hảo Hảo', 4500, 200),
('Nước mắm Nam Ngư', 45000, 30),
('Dầu ăn Tường An 1L', 55000, 40),
('Gạo ST25 5kg', 180000, 20),
('Đường tinh luyện Biên Hòa 1kg', 28000, 60),
('Muối I-ốt Bạc Liêu', 6000, 100),
('Bột ngọt AJI-NO-MOTO 400g', 32000, 45),
('Nước tương Maggi', 22000, 35),
('Tương ớt Chinsu', 15000, 50),
('Bột giặt OMO 800g', 48000, 25),
('Nước rửa chén Sunlight', 38000, 30),
('Giấy vệ sinh Watersilk', 42000, 40),
('Kem đánh răng PS', 35000, 50),
('Dầu gội Clear 630g', 165000, 15),
('Sữa tắm Lifebuoy 800g', 155000, 18),
('Trứng gà Ba Huân (vỉ 10 quả)', 33000, 30),
('Xúc xích Vissan', 52000, 25),
('Bánh mì Sandwich', 25000, 20),
('Nước giải khát Coca Cola 1.5L', 22000, 60);
-- Bài 1: Lấy danh sách tên và giá sản phẩm, đổi tên cột hiển thị
SELECT 
    product_name AS "TenSanPham", 
    price AS "DonGia"
FROM products;
-- Bài 2: Tìm thông tin khách hàng có chữ lót là "Văn"
SELECT 
    full_name, 
    phone_number
FROM customers
WHERE full_name LIKE '%Văn%';
-- Bài 3: Sắp xếp danh sách sản phẩm theo giá giảm dần (từ đắt nhất đến rẻ nhất)
SELECT 
    product_name, 
    price
FROM products
ORDER BY price DESC;
-- Bài 4: Lấy tên và giá của 3 sản phẩm có giá thấp nhất
SELECT 
    product_name, 
    price
FROM products
ORDER BY price ASC
LIMIT 3;