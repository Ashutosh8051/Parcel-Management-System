<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>Contact Support</title>

  <!-- Google Font: Poppins -->
  <link href="https://fonts.googleapis.com/css2?family=Poppins&display=swap" rel="stylesheet">

  <style>
    :root {
      --primary-color: #4CAF50;
      --secondary-color: #f4f4f4;
    }

    body {
      margin: 0;
      font-family: 'Poppins', sans-serif;
      background-color: var(--secondary-color);
    }

    .modal {
      display: block;
      position: fixed;
      z-index: 1000;
      left: 0;
      top: 0;
      width: 100%;
      height: 100%;
      background-color: rgba(0,0,0,0.5);
    }

    .modal-content {
      background-color: #fff;
      width: 80%;
      height: auto;
      max-height: 90%;
      margin: 5% auto;
      padding: 40px;
      border-radius: 12px;
      box-shadow: 0 0 20px rgba(0, 0, 0, 0.3);
      overflow: hidden;
      display: flex;
      flex-direction: column;
      align-items: center;
    }

    h2 {
      text-align: center;
      color: var(--primary-color);
      margin-bottom: 30px;
      width: 100%;
    }

    .content-container {
      display: flex;
      justify-content: space-between;
      align-items: flex-start;
      width: 100%;
      gap: 40px;
    }

    .info-group {
      flex: 1;
      font-size: 18px;
      color: #333;
    }

    .info-label {
      font-weight: bold;
      margin-top: 20px;
      display: block;
      color: var(--primary-color);
    }

    .info-value a {
      color: #333;
      text-decoration: none;
      font-weight: 500;
    }

    .info-value a:hover {
      text-decoration: none;
    }

    .map-container {
      flex: 1;
      border-radius: 10px;
      overflow: hidden;
    }

    .map-container iframe {
      width: 100%;
      height: 300px;
      border: none;
      border-radius: 10px;
    }

    .button-container {
      text-align: center;
      margin-top: 40px;
      width: 100%;
    }
	a{
	text-decoration:none;
	}
    .close-btn {
      background-color: #4CAF50;
      color: white;
      border: none;
      padding: 12px 30px;
      cursor: pointer;
      border-radius: 5px;
      font-size: 16px;
    }

    .close-btn:hover {
      background-color: #4CAF50;
    }

    @media (max-width: 768px) {
      .content-container {
        flex-direction: column;
        align-items: center;
      }

      .map-container iframe {
        height: 250px;
      }
    }
  </style>
</head>
<body>

<div id="supportModal" class="modal">
  <div class="modal-content">
    <h2>Contact Support</h2>

    <div class="content-container">
      <div class="info-group">
        <label class="info-label">Mail Us:</label>
        <div class="info-value">
          <a href="mailto:support@example.com"><b>support@example.com</b></a>
        </div>

        <label class="info-label">Mobile:</label>
        <div class="info-value">
          <a href="tel:+911234567890"><b>+91 12345 67890</b></a>
        </div>

        <label class="info-label">Address:</label>
        <div class="info-value">
          <a href="https://www.google.com/maps?q=123+Main+Street,+Delhi,+India" target="_blank">
            
			<b>123, Main St, Block G1, <br>
			Block G, Block H, Aya Nagar, <br>
			New Delhi, Delhi 110047</b>
          </a>
        </div>
      </div>

      <div class="map-container">
        <iframe 
          src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d112051.09519021997!2d77.1024907542827!3d28.70406009494862!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x390cfd1df69e6223%3A0xfdb62328c1f0e046!2s123%20Main%20St%2C%20Delhi%2C%20India!5e0!3m2!1sen!2sin!4v1618041875950!5m2!1sen!2sin"
          allowfullscreen
          loading="lazy">
        </iframe>
      </div>
    </div>

    <div class="button-container">
      <button class="close-btn" onclick="closeModal()">Close</button>
    </div>
  </div>
</div>

<script>
  function closeModal() {
    window.location.href = 'customerHome.jsp';
  }
</script>

</body>
</html>
