#!/bin/bash

yum update -y

yum install -y httpd

systemctl start httpd
systemctl enable httpd

cat <<'EOF' > /var/www/html/index.html
<!DOCTYPE html>
<html>
<head>
    <title>Increment and Decrement Counter - Server 2</title>

    <style>
        body {
            font-family: Arial, sans-serif;
            text-align: center;
            margin-top: 100px;
        }

        button {
            padding: 10px 20px;
            font-size: 20px;
            margin: 10px;
            cursor: pointer;
        }

        h1 {
            color: #333;
        }

        h2 {
            font-size: 40px;
        }
    </style>
</head>

<body>

    <h1>Increment and Decrement Counter</h1>

    <button onclick="increment()">+</button>

    <h2 id="counting">0</h2>

    <button onclick="decrement()">-</button>

    <script>
        let count = 0;

        function increment() {
            count++;
            document.getElementById("counting").innerHTML = count;
        }

        function decrement() {
            if (count > 0) {
                count--;
                document.getElementById("counting").innerHTML = count;
            }
        }
    </script>

</body>
</html>
EOF

systemctl restart httpd