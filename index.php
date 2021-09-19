<?php 
  $nama = '';
  $nama=$_GET['nama']; 
?>
<html>
  <style>
    #container {
      text-align: center;
    }
  </style>
  <div id="container">
    <h2>Selamat Datang <?php echo $nama; ?> di Website Kami</h2>
	<form action="" method="get">
	  <input type="text" name="nama">
	  <br>
	  <input type="submit" name="submit">
	</form>
  </div>
</html>
