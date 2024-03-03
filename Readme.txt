Các lưu ý:
- user_id đuợc lấy từ token chứ không phải body
- các API trong Postman đang được gắn token của user_id = 2 nên dữ liệu được tạo ra là của  user_id = 2
- có thể sử dụng tính năng login để lấy token của user_id khác 2


Các biến môi trường .env
DB_DATABASE=BTBuoi6_DB
DB_USER=root
DB_PASS=1234
DB_HOST=localhost
DB_PORT=3306
DB_DIALECT=mysql