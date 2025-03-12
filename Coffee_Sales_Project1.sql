SELECT *
FROM coffee_shop_sales css;

DESCRIBE coffee_shop_sales;

-- Chuẩn hóa 2 cột transaction_date và transaction_time thành kiểu dữ liệu date và time

UPDATE coffee_shop_sales
SET transaction_date = STR_TO_DATE(transaction_date, '%m/%d/%Y');

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_date DATE;

UPDATE coffee_shop_sales
SET transaction_time = STR_TO_DATE(transaction_time, '%H:%i:%s');

ALTER TABLE coffee_shop_sales
MODIFY COLUMN transaction_time TIME;


/* Phân tích doanh thu bán hàng */

-- Tổng doanh số của từng tháng tương ứng.
SELECT 
	ROUND(SUM(unit_price * transaction_qty)) as Total_Sales 
FROM 
	coffee_shop_sales 
WHERE 
	MONTH(transaction_date) = 5; -- ví dụ là tháng 5

-- Mức tăng hoặc giảm doanh thu theo từng tháng. 
-- Chênh lệch doanh thu và phần trăm tăng trưởng qua từng tháng (%MoM)

SELECT 
    MONTH(transaction_date) AS month,
    ROUND(SUM(unit_price * transaction_qty)) AS total_sales,
    (SUM(unit_price * transaction_qty) - LAG(SUM(unit_price * transaction_qty), 1) 
    OVER (ORDER BY MONTH(transaction_date))) / LAG(SUM(unit_price * transaction_qty), 1) 
    OVER (ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) IN (3, 4, 5) -- ví dụ từ tháng 3 đến tháng 5
GROUP BY 
    MONTH(transaction_date)
ORDER BY 
    MONTH(transaction_date);

/* Phân tích tổng số đơn hàng */

-- Tổng số đơn hàng của từng tháng tương ứng.

SELECT 
	COUNT(transaction_id) as total_orders
FROM 
	coffee_shop_sales 
WHERE 
	MONTH (transaction_date)= 5; -- ví dụ là tháng 5
	
	
-- Mức tăng hoặc giảm đơn đặt hàng theo từng tháng. 
-- Chênh lệch tổng số đơn đặt hàng và phần trăm tăng trưởng qua từng tháng (%MoM) 

SELECT 
    MONTH(transaction_date) AS month,
    ROUND(COUNT(transaction_id)) AS total_orders,
    (COUNT(transaction_id) - LAG(COUNT(transaction_id), 1) 
    OVER (ORDER BY MONTH(transaction_date))) / LAG(COUNT(transaction_id), 1) 
    OVER (ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) IN (4, 5, 6) -- ví dụ từ tháng 4 đến tháng 6
GROUP BY 
    MONTH(transaction_date)
ORDER BY 
    MONTH(transaction_date);

/* Phân tích tổng số lượng bán ra */

-- Tổng số lượng bán ra của từng tháng tương ứng.

SELECT 
	SUM(transaction_qty) as Total_Quantity_Sold
FROM 
	coffee_shop_sales 
WHERE 
	MONTH(transaction_date) = 5; -- ví dụ là tháng 5
	
	
-- Mức tăng hoặc giảm đơn số lượng bán ra theo từng tháng. 
-- Chênh lệch tổng số lượng bán ra và phần trăm tăng trưởng qua từng tháng (%MoM) 

SELECT 
    MONTH(transaction_date) AS month,
    ROUND(SUM(transaction_qty)) AS total_quantity_sold,
    (SUM(transaction_qty) - LAG(SUM(transaction_qty), 1) 
    OVER (ORDER BY MONTH(transaction_date))) / LAG(SUM(transaction_qty), 1) 
    OVER (ORDER BY MONTH(transaction_date)) * 100 AS mom_increase_percentage
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) IN (2, 3, 4, 5) -- ví dụ từ tháng 2 đến tháng 5
GROUP BY 
    MONTH(transaction_date)
ORDER BY 
    MONTH(transaction_date);
    
/* Biểu đồ Lịch – DAILY SALES, QUANTITY and TOTAL ORDERS */
   
SELECT
    CONCAT(ROUND(SUM(unit_price * transaction_qty) / 1000, 1),'K') AS total_sales,
    CONCAT(ROUND(COUNT(transaction_id) / 1000, 1),'K') AS total_orders,
    CONCAT(ROUND(SUM(transaction_qty) / 1000, 1),'K') AS total_quantity_sold
FROM 
    coffee_shop_sales
WHERE 
    transaction_date = '2023-05-18'; -- ví dụ là ngày 18/5/2023
 
/* Trung bình (Xu hướng) doanh số qua từng thời điểm */
    
SELECT AVG(total_sales) AS average_sales
FROM (
    SELECT 
        SUM(unit_price * transaction_qty) AS total_sales
    FROM 
        coffee_shop_sales
	WHERE 
        MONTH(transaction_date) = 5  -- ví dụ cho 1 tháng -> tháng 5
    GROUP BY 
        transaction_date
) AS internal_query;

-- Ví dụ cho tất cả các tháng

SELECT 
    YEAR(transaction_date) AS year,
    MONTH(transaction_date) AS month,
    ROUND(SUM(unit_price * transaction_qty)) AS total_sales,
    ROUND(
    	AVG(SUM(unit_price * transaction_qty)) 
    	OVER (ORDER BY YEAR(transaction_date), MONTH(transaction_date)), 0) moving_avg_sales
FROM 
    coffee_shop_sales
GROUP BY 
    YEAR(transaction_date), MONTH(transaction_date)
ORDER BY 
    YEAR(transaction_date), MONTH(transaction_date);
    
/* Daily Sales - Doanh số hàng ngày (tùy chọn tháng) */   

SELECT 
    DAY(transaction_date) AS day_of_month,
    ROUND(SUM(unit_price * transaction_qty),1) AS total_sales
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) = 5  -- ví dụ tháng 5
GROUP BY 
    DAY(transaction_date)
ORDER BY 
    DAY(transaction_date);
   
   
/* So sánh doanh số hàng ngày với doanh số trung bình trong tháng - Daily vs Average */
 
SELECT 
    day_of_month,
    CASE 
        WHEN total_sales > avg_sales THEN 'Above Average'
        WHEN total_sales < avg_sales THEN 'Below Average'
        ELSE 'Average'
    END AS sales_status,
    total_sales
FROM (
    SELECT 
        DAY(transaction_date) AS day_of_month,
        SUM(unit_price * transaction_qty) AS total_sales,
        AVG(SUM(unit_price * transaction_qty)) OVER () AS avg_sales
    FROM 
        coffee_shop_sales
    WHERE 
        MONTH(transaction_date) = 5  -- ví dụ tháng 5
    GROUP BY 
        DAY(transaction_date)
) AS sales_data
ORDER BY 
    sales_status, day_of_month;

/* Doanh số bào các ngày trong tuần và cuối tuần */

-- Doanh thu ngày trong tuần và cuối tuần của các tháng và phần trăm của từng tháng
   
SELECT 
    CASE 
        WHEN DAYOFWEEK(transaction_date) IN (1, 7) THEN 'Weekends'
        ELSE 'Weekdays'
    END AS day_type,
    ROUND(SUM(unit_price * transaction_qty), 2) AS total_sales,
    ROUND(SUM(unit_price * transaction_qty) * 100 / 
          (SELECT SUM(unit_price * transaction_qty) FROM coffee_shop_sales WHERE MONTH(transaction_date) = 5), 2) 
          AS percentage_of_total
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) = 5 -- ví dụ tháng 5
GROUP BY 
    day_type;

-- Doanh thu theo các ngày trong tuần của 1 tháng và phần trăm chênh lệch    
   
SELECT 
    DAYNAME(transaction_date) AS day_of_week,
    ROUND(SUM(unit_price * transaction_qty), 2) AS total_sales,
    ROUND(SUM(unit_price * transaction_qty) / (SELECT SUM(unit_price * transaction_qty) 
                                               FROM coffee_shop_sales 
                                               WHERE MONTH(transaction_date) = 5) * 100, 2) AS percentage_of_total
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) = 5 -- ví dụ tháng 5
GROUP BY 
    day_of_week
ORDER BY 
    FIELD(day_of_week, 'Monday', 'Tuesday', 'Wednesday', 'Thursday', 'Friday', 'Saturday', 'Sunday');


/* Doanh số theo địa điểm cửa hàng */
 
SELECT 
    store_location,
    ROUND(SUM(unit_price * transaction_qty), 2) AS total_sales,
    ROUND(SUM(unit_price * transaction_qty) * 100 / 
          (SELECT SUM(unit_price * transaction_qty) 
           FROM coffee_shop_sales 
           WHERE MONTH(transaction_date) = 5), 2) 
          AS percentage_of_total
FROM 
	coffee_shop_sales
WHERE 
	MONTH(transaction_date) = 5
GROUP BY 
	store_location
ORDER BY 
	total_sales DESC;


/* Doanh số theo thể loại sản phẩm */

SELECT 
    product_category,
    ROUND(SUM(unit_price * transaction_qty), 1) AS total_sales,
    ROUND(SUM(unit_price * transaction_qty) * 100 / 
          (SELECT SUM(unit_price * transaction_qty) 
          FROM coffee_shop_sales 
          WHERE MONTH(transaction_date) = 5), 2) 
          AS percentage_of_total
FROM 
	coffee_shop_sales
WHERE 
	MONTH(transaction_date) = 5
GROUP BY 
	product_category
ORDER BY 
	total_sales DESC;

/* Doanh số theo top 10 sản phẩm */

SELECT 
    product_type,
    ROUND(SUM(unit_price * transaction_qty), 1) AS total_sales,
    ROUND(SUM(unit_price * transaction_qty) * 100 / 
          (SELECT SUM(unit_price * transaction_qty) FROM coffee_shop_sales WHERE MONTH(transaction_date) = 5), 2) 
          AS percentage_of_total
FROM 
	coffee_shop_sales
WHERE 
	MONTH(transaction_date) = 5
GROUP BY 
	product_type
ORDER BY 
	total_sales DESC
LIMIT 10;

/* Doanh số theo ngày, giờ */

SELECT 
    ROUND(SUM(unit_price * transaction_qty)) AS Total_Sales,
    SUM(transaction_qty) AS Total_Quantity,
    COUNT(*) AS Total_Orders
FROM 
    coffee_shop_sales
WHERE 
    DAYOFWEEK(transaction_date) = 3 -- Filter for Tuesday (1 is Sunday, 2 is Monday, ..., 7 is Saturday)
    AND HOUR(transaction_time) = 8 -- Filter for hour number 8
    AND MONTH(transaction_date) = 5; -- Filter for May (month number 5)
    ;

/* Doanh số theo ngày trong tháng */  
   
SELECT 
    CASE 
        WHEN DAYOFWEEK(transaction_date) = 2 THEN 'Monday'
        WHEN DAYOFWEEK(transaction_date) = 3 THEN 'Tuesday'
        WHEN DAYOFWEEK(transaction_date) = 4 THEN 'Wednesday'
        WHEN DAYOFWEEK(transaction_date) = 5 THEN 'Thursday'
        WHEN DAYOFWEEK(transaction_date) = 6 THEN 'Friday'
        WHEN DAYOFWEEK(transaction_date) = 7 THEN 'Saturday'
        ELSE 'Sunday'
    END AS Day_of_Week,
    ROUND(SUM(unit_price * transaction_qty)) AS Total_Sales
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) = 5 -- Filter for May (month number 5)
GROUP BY 
    CASE 
        WHEN DAYOFWEEK(transaction_date) = 2 THEN 'Monday'
        WHEN DAYOFWEEK(transaction_date) = 3 THEN 'Tuesday'
        WHEN DAYOFWEEK(transaction_date) = 4 THEN 'Wednesday'
        WHEN DAYOFWEEK(transaction_date) = 5 THEN 'Thursday'
        WHEN DAYOFWEEK(transaction_date) = 6 THEN 'Friday'
        WHEN DAYOFWEEK(transaction_date) = 7 THEN 'Saturday'
        ELSE 'Sunday'
    END;


/* Doanh số theo giờ trong tháng */  
   
SELECT 
    HOUR(transaction_time) AS Hour_of_Day,
    ROUND(SUM(unit_price * transaction_qty)) AS Total_Sales
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) = 5 -- Filter for May (month number 5)
GROUP BY 
    HOUR(transaction_time)
ORDER BY 
    HOUR(transaction_time);


   
SELECT 
    CASE 
        WHEN DAYOFWEEK(transaction_date) = 2 THEN 'Monday'
        WHEN DAYOFWEEK(transaction_date) = 3 THEN 'Tuesday'
        WHEN DAYOFWEEK(transaction_date) = 4 THEN 'Wednesday'
        WHEN DAYOFWEEK(transaction_date) = 5 THEN 'Thursday'
        WHEN DAYOFWEEK(transaction_date) = 6 THEN 'Friday'
        WHEN DAYOFWEEK(transaction_date) = 7 THEN 'Saturday'
        ELSE 'Sunday'
    END AS day_of_week,
    HOUR(transaction_time) AS hour_of_day,
    ROUND(SUM(unit_price * transaction_qty)) AS total_sales
FROM 
    coffee_shop_sales
WHERE 
    MONTH(transaction_date) = 5
GROUP BY 
    DAYOFWEEK(transaction_date), HOUR(transaction_time)
ORDER BY 
    DAYOFWEEK(transaction_date), HOUR(transaction_time);
   

   