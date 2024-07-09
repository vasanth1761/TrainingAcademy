<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Payment Form</title>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css">
<style>
    body {
        font-family: Arial, sans-serif;
        background-color: #f0f0f0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        margin: 0;
    }
    .payment-form {
        background-color: #fff;
        padding: 20px;
        border-radius: 8px;
        box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        width: 300px;
        text-align: center; 
    }
    .payment-icons {
        display: flex;
        justify-content: space-between;
        margin-bottom: 20px;
    }
    .payment-icons i {
        font-size: 60px; 
        cursor: pointer;
    }
    .payment-form label,
    .payment-form select,
    .payment-form input {
        display: block;
        margin-bottom: 10px;
        width: 100%;
        box-sizing: border-box;
        padding: 8px;
        font-size: 14px;
    }
    .payment-form input[type="submit"] {
        background-color: blue;
        color: white;
        border: none;
        cursor: pointer;
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 5px;
    }
    .payment-form input[type="submit"]:hover
    {
        background-color: green;
    }
    .payment-form button{
    background-color: blue;
        color: white;
        border: none;
        cursor: pointer;
        padding: 10px 20px;
        font-size: 16px;
        border-radius: 5px;
    
    }
    .payment-form button:hover{
    background-color: green;
    
    }
</style>
</head>
<body>
  <form action="/paymentDetails" method="post"> 
<div class="payment-form">
    <h2>Payment Information</h2>
    <div class="payment-icons">
        <i class="fab fa-cc-visa" title="Visa"></i>
        <i class="fab fa-cc-mastercard" title="Mastercard"></i>
        <i class="fab fa-cc-amex" title="American Express"></i> 
    </div>
    
    <label for="card-type"><b>Card Type</b></label>
    <select id="card-type" name="card-type" >
        <option value="visa">Visa</option>
        <option value="mastercard">Credit card</option>
        <option value="amex">Debit card</option>
    </select>
    <label for="account-number"><b>Account Number</b></label>
    <input type="text" id="account-number" name="account-number" placeholder="Enter account number"  pattern="[0-9]{12}"  required>


    <label for="expiry-date"><b>Expiry Date</b></label>
    <input type="text" id="expiry-date" name="expiry-date" placeholder="MM/YYYY" required>
    
    <label for="cvv"><b>CVV</b></label>
    <input type="text" id="cvv" name="cvv" placeholder="Enter CVV" pattern="[0-9]{3}"required>
    
    <button type="submit" name="pay" value="Paid">pay</button>
</div>
</form> 

</body>
</html>
