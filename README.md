![](https://workplus.co.th/wp-content/uploads/Atelier-Power-BI-1024x371.png)

#  _DATA ANALYST USING POWER BI_ 

## 1. Loan Management Dashboard at TP-Bank

### 1. Tổng quan

##### Các Metrics Chính (Chỉ số quan trọng)
- DSGN (Disbursement - Giải ngân): Tổng số tiền cho vay được giải ngân.
- Dư nợ (Outstanding Loan): Tổng số dư nợ hiện tại của danh mục cho vay ô tô.
- NII (Net Interest Income - Thu nhập lãi thuần): Lợi nhuận từ lãi suất sau khi trừ chi phí lãi vay.
- Dư nợ WO (Write-Off Loans): Dư nợ bị xóa sổ do không thể thu hồi.
- OD2 (% Overdue 2 - Nợ quá hạn nhóm 2): Tỷ lệ nợ quá hạn từ 10-30 ngày, phản ánh chất lượng tín dụng.
- Tỷ lệ OD3-5: Tỷ lệ nợ xấu từ nhóm 3 đến nhóm 5 (nợ có khả năng mất vốn).

##### Các Charts (Biểu đồ chính)
- Quy mô Dư Nợ (Bar + Line chart)
    - Cột màu tím: Tổng dư nợ theo tháng.
    - Đường màu cam: Tỷ lệ OD2.
    - Đường màu xanh: Tỷ lệ OD3-5.
=> Mục đích: Theo dõi xu hướng dư nợ và mức độ rủi ro.
- NII & Margin (Bar + Line chart)
    - Cột màu tím: NII theo từng tháng.
    - Đường màu cam: Biên lãi suất (Margin).
=> Mục đích: Đánh giá lợi nhuận từ lãi suất theo thời gian.

![](https://raw.githubusercontent.com/DinhVu29/Power_BI_Project/refs/heads/main/Qu%E1%BA%A3n%20tr%E1%BB%8B%20s%E1%BA%A3n%20ph%E1%BA%A9m%20cho%20vay%20%C3%B4%20t%C3%B4%20TP-Bank/T%E1%BB%95ng%20Quan.jpg)

### 2. Top Chi Nhánh 

##### Top 10 ĐVKD theo dư nợ (Bar chart - Cột tím)

- Hiển thị 10 đơn vị kinh doanh có dư nợ cao nhất.
- Giúp xác định các ĐVKD đóng góp lớn nhất vào danh mục cho vay ô tô.

##### Top 10 ĐVKD theo dư nợ (khách hàng) (Horizontal bar chart - Cột tím)

- Danh sách 10 khách hàng có dư nợ cao nhất.
- Hỗ trợ quản lý khách hàng có khoản vay lớn.

##### Top 10 ĐVKD theo tỷ lệ OD2 (Bar + Line chart - Cột tím & Đường cam)

- Cột tím: Dư nợ của ĐVKD.
- Đường cam: Tỷ lệ OD2 (nợ quá hạn nhóm 2).
- Giúp theo dõi ĐVKD có rủi ro tín dụng cao trong ngắn hạn.

##### Top 10 ĐVKD theo tỷ lệ OD3-5 (Bar + Line chart - Cột tím & Đường cam)

- Cột tím: Dư nợ của ĐVKD.
- Đường cam: Tỷ lệ OD3-5 (nợ xấu nhóm 3-5).
- Xác định các ĐVKD có rủi ro tín dụng dài hạn cao nhất.

![](https://raw.githubusercontent.com/DinhVu29/Power_BI_Project/refs/heads/main/Qu%E1%BA%A3n%20tr%E1%BB%8B%20s%E1%BA%A3n%20ph%E1%BA%A9m%20cho%20vay%20%C3%B4%20t%C3%B4%20TP-Bank/Top%20Chi%20Nh%C3%A1nh.jpg)

### 3. Cơ Cấu Dư Nợ
##### Dư nợ trên mục đích vay theo loại hình ĐVKD (Stacked Bar Chart - Cột nhiều màu)

- Hiển thị dư nợ phân theo mục đích vay (du lịch đi lại, tải & đầu kéo, du lịch kinh doanh, v.v.) và loại hình ĐVKD (Chi nhánh, Phòng kinh doanh, Trung tâm bán).
- Cho thấy loại hình kinh doanh nào đóng góp nhiều nhất vào từng mục đích vay.

##### Dư nợ hàng tháng theo mục đích vay (Stacked Column Chart - Cột nhiều màu)

- Biểu đồ cột thể hiện dư nợ theo từng tháng trong năm 2024.
- Các màu sắc biểu thị từng mục đích vay (chuyên dụng, du lịch đi lại, du lịch kinh doanh, tải & đầu kéo, v.v.).
- Giúp theo dõi xu hướng thay đổi dư nợ trong thời gian dài.

##### Cơ cấu số lượng khoản vay theo mục đích vay (Pie Chart - Biểu đồ tròn)

- Minh họa tỷ lệ số lượng khoản vay theo mục đích vay.
- Du lịch đi lại chiếm tỷ trọng cao nhất (60%), tiếp theo là tải & đầu kéo (26%).
- Giúp xác định loại hình vay phổ biến nhất trong danh mục tín dụng ô tô
.
##### Tỷ lệ OD3-5 hàng tháng theo mục đích vay (Bảng số liệu)

- Theo dõi tỷ lệ nợ xấu nhóm 3-5 (OD3-5) theo từng mục đích vay.
- Cho thấy mức độ rủi ro tín dụng của từng nhóm vay theo thời gian.
- Ví dụ: Nợ xấu cao nhất trong nhóm "Khác" (20.5%) và thấp nhất trong nhóm "Tải & đầu kéo" (~1.1%).

![](https://raw.githubusercontent.com/DinhVu29/Power_BI_Project/refs/heads/main/Qu%E1%BA%A3n%20tr%E1%BB%8B%20s%E1%BA%A3n%20ph%E1%BA%A9m%20cho%20vay%20%C3%B4%20t%C3%B4%20TP-Bank/C%C6%A1%20c%E1%BA%A5u%20d%C6%B0%20n%E1%BB%A3.jpg)

### 4. Chương Trình UDLS

##### Dư nợ và tỷ lệ nợ OD2, OD3-5 theo đối tác (Bar & Line Chart - Biểu đồ cột & đường kết hợp)

- Cột màu tím: Tổng dư nợ của từng đối tác.
- Đường màu cam: Tỷ lệ OD2 (nợ quá hạn 10-30 ngày).
- Đường màu xanh: Tỷ lệ OD3-5 (nợ xấu trên 30 ngày).
- Ví dụ: Đối tác "Thần tốc" có dư nợ cao nhất (3,652K) nhưng tỷ lệ nợ xấu OD3-5 lên đến 11%.

##### Thu nợ và giải ngân theo thời gian (Line Chart - Biểu đồ đường kép)

- Đường màu tím: Tổng thu nợ từng tháng.
- Đường màu cam: Tổng giải ngân từng tháng.
- Xu hướng: Giải ngân tăng từ tháng 2 đến tháng 5 nhưng có sự giảm nhẹ từ tháng 6 trở đi.

##### Doanh số giải ngân đối tác theo tháng (Bảng số liệu)

- Hiển thị số tiền giải ngân của từng đối tác theo thời gian.
- Các đối tác chính như Thần tốc, Ford, Mitsubishi, Thaco có mức giải ngân khác nhau theo từng tháng.
- Ví dụ: Thần tốc có mức giải ngân cao nhất, đạt đỉnh vào tháng 6 (187,059).

![](https://raw.githubusercontent.com/DinhVu29/Power_BI_Project/refs/heads/main/Qu%E1%BA%A3n%20tr%E1%BB%8B%20s%E1%BA%A3n%20ph%E1%BA%A9m%20cho%20vay%20%C3%B4%20t%C3%B4%20TP-Bank/Ch%C6%B0%C6%A1ng%20tr%C3%ACnh%20UDLS.jpg)

### 5. Hoa Hồng CTV

##### Thù lao CTV theo tháng (Bar Chart - Biểu đồ cột)

- Mức chi trả hoa hồng cho CTV tăng mạnh từ tháng 6 (3) lên tháng 7 (1,417) và tháng 8 (1,326).
- Điều này có thể phản ánh sự mở rộng hoạt động hoặc chính sách khuyến khích tốt hơn.

##### Top 10 ĐVKD chi trả cao nhất (Horizontal Bar Chart - Biểu đồ cột ngang)

- Đơn vị TTB.MB1 chi trả thù lao cao nhất (196), tiếp theo là TTB.MB4 (101) và TTB.MB2 (98).
- Điều này có thể phản ánh sự khác biệt về doanh số và chính sách hoa hồng giữa các ĐVKD.

##### Cơ cấu thù lao CTV theo đối tác (Pie Chart - Biểu đồ tròn)

- Đối tác "Thần tốc" chiếm tỷ trọng lớn nhất với 72% (1,976).
- Ford đứng thứ hai (20% - 540), còn Mitsubishi (MMV) chỉ chiếm 6% (170).

##### Cơ cấu thù lao CTV theo loại hình ĐVKD (Pie Chart - Biểu đồ tròn)

- Chi nhánh chiếm 64% (276), tiếp theo là Trung tâm bán (26%) và Phòng kinh doanh (10%).
- Điều này cho thấy phần lớn hoa hồng được trả thông qua chi nhánh.

##### Top 5 CTV có nhiều khoản vay (Bar Chart - Biểu đồ thanh ngang)

- Nguyễn Đăng Khương dẫn đầu với 11 khoản vay và thù lao 67.
- Nguyễn Hồng Cầm đứng thứ hai (9 khoản vay, thù lao 80), tiếp theo là Trần Thị Thảo Nhu (9 khoản, 49 thù lao).

![](https://raw.githubusercontent.com/DinhVu29/Power_BI_Project/refs/heads/main/Qu%E1%BA%A3n%20tr%E1%BB%8B%20s%E1%BA%A3n%20ph%E1%BA%A9m%20cho%20vay%20%C3%B4%20t%C3%B4%20TP-Bank/Hoa%20h%E1%BB%93ng%20CTV.jpg)

### 6. Đấu Giá & Thu Giữ Xe

Bar Chart (cột xanh & cam): So sánh dư nợ xe thu giữ và giá trị trúng đấu giá theo tháng.
Line Chart (đường tím & vàng): Thể hiện xu hướng số xe thu giữ và số xe trúng đấu giá.

![](https://raw.githubusercontent.com/DinhVu29/Power_BI_Project/refs/heads/main/Qu%E1%BA%A3n%20tr%E1%BB%8B%20s%E1%BA%A3n%20ph%E1%BA%A9m%20cho%20vay%20%C3%B4%20t%C3%B4%20TP-Bank/%C4%90%E1%BA%A5u%20gi%C3%A1%20%26%20Thu%20gi%E1%BB%AF%20Xe.jpg)


## 2. Coffee Shop Sales Dashboard 
### 1. Dashboard 

#### 1.1. Chỉ số hiệu suất chính (KPIs)

###### Tổng quan doanh số (Total Sales Analysis)
- Tổng doanh thu.
- Phân tích tăng/giảm doanh thu giữa các tháng.

###### Tổng số đơn hàng (Total Orders Analysis)
- Tổng số đơn hàng.
- So sánh mức tăng trưởng so với tháng trước.

###### Tổng số lượng bán ra (Total Quantity Sold Analysis)
- Tổng sản phẩm bán được.
- So sánh mức tăng/giảm so với tháng trước.

#### 1.2. Biểu đồ (Charts)

###### Calendar Heat Map (Bản đồ nhiệt theo lịch)
- Hiển thị doanh thu theo từng ngày với sắc độ đậm nhạt để biểu thị mức bán hàng.
- Ứng dụng trong dashboard: Bảng ngày tháng bên trái thể hiện doanh số theo lịch.

###### Sales by Weekdays/Weekends (Doanh số theo ngày trong tuần & cuối tuần)
- Tuần.
- Cuối tuần.
- Giúp đánh giá sự khác biệt về xu hướng mua hàng theo ngày.

###### Sales by Store Location (Doanh số theo cửa hàng)
- Top 3 cửa hàng có doanh số cao nhất:
Hells Kitchen: $52.6K
Astoria: $52.4K
Lower Manhattan: $51.7K
- Biểu đồ giúp so sánh hiệu suất từng chi nhánh theo thời gian.

###### Daily Sales Analysis with Average Line (Doanh số hàng ngày & đường trung bình)
- Biểu đồ cột thể hiện doanh số hàng ngày với đường trung bình giúp xác định ngày bán hàng nổi bật.

###### Sales by Product Category (Doanh số theo danh mục sản phẩm)
- Top sản phẩm đóng góp chính:
Cà phê: $60.4K
Trà: $44.5K
Bánh ngọt: $18.6K
- Giúp xác định sản phẩm chiến lược để tập trung kinh doanh.

###### Top 10 Products by Sales (Top 10 sản phẩm bán chạy)
- Hiển thị 10 sản phẩm bán chạy nhất theo doanh thu.

###### Sales by Days and Hours (Doanh số theo ngày & giờ)
- Bản đồ nhiệt cho thấy doanh số theo từng giờ trong ngày.
- Giờ cao điểm: 8h - 12h sáng, đặc biệt vào thứ Hai & Ba ($25K/ngày).

![](https://raw.githubusercontent.com/DinhVu29/Power_BI_Project/refs/heads/main/Coffee%20Sales%20Dashboard.png)

### 2. Tooltip 
##### 2.1. Tooltip - Calendar Chart (Bảng Lịch)
- Chức năng: Hiển thị doanh số khi di chuột vào một ngày trong biểu đồ lịch (02/06/2023 - Thứ Sáu).
- Thông tin:
Đơn hàng; Doanh thu; Số lượng bán ra;  Giảm so với tháng trước.
- Ứng dụng: Theo dõi xu hướng doanh số theo ngày.

##### 2.2. Tooltip - Matrix Hour Day (Ma trận Ngày - Giờ)
- Chức năng: Hiển thị doanh số theo giờ trong ngày (12h trưa, Thứ Sáu).
- Thông tin:
Đơn hàng; Doanh thu; Số lượng bán ra;  Giảm so với tháng trước.
- Giảm so với tháng trước
- Ứng dụng: Xác định giờ cao điểm, tối ưu chiến lược bán hàng.
 
![](https://raw.githubusercontent.com/DinhVu29/Power_BI_Project/refs/heads/main/Tooltip.png)
