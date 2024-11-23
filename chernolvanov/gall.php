<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Фотоальбом</title>
  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <!-- Put this script tag to the <head> of your page -->
<script type="text/javascript" src="//vk.com/js/api/openapi.js?152"></script>
</head>
<body>
  <?php
		require_once "blocks/headerL.php"
	?>
<div class="container">
<h4 class="blue-text ">Фотоальбом</h4>
<center>
	<div class="row">
	
	<div class="col l4 s12">
	<div class="card">
	<img class="materialboxed" width="250" src="/images/g7.jpg">
	</div>
	</div>
	<div class="col l4 s12">
	<div class="card">
	<img class="materialboxed" width="250" src="/images/g5.jpg">
	</div>
	</div>
	<div class="col l4 s12">
	<div class="card">
	<img class="materialboxed" width="250" src="/images/g6.jpg">
	</div>
	</div>
	<div class="col l4 s12">
	<div class="card">
	<img class="materialboxed" width="250" src="/images/g12.jpg">
	</div>
	</div>
	<div class="col l4 s12">
	<div class="card">
	<img class="materialboxed" width="250" src="/images/g3.jpg">
	</div>
	</div>
	<div class="col l4 s12">
	<div class="card">
	<img class="materialboxed" width="250" src="/images/g9.jpg">
	</div>
	</div>
	</div>
	<div class="row">
	
	<div class="col l4 s12">
	<div class="card">
	<img class="materialboxed" width="250" src="/images/g2.jpg">
	</div>
	</div>
	<div class="col l4 s12">
		<div class="card">
	<img class="materialboxed" width="250" src="/images/g8.jpg">
	</div>
	</div>
	
	<div class="col l4 s12">
	<div class="card">
	<img class="materialboxed" width="250" src="/images/g4.jpg">
	</div>
	</div>
	</div>
	<div class="row">
	<div class="col l4 s12">
	<div class="card">
	<img class="materialboxed" width="250" src="/images/g10.jpg">
	</div>
	</div>
	<div class="col l4 s12">
	<div class="card">
	<img class="materialboxed" width="250" src="/images/g11.jpg">
	</div>
	</div>
	<div class="col l4 s12">
	<div class="card">
	<img class="materialboxed" width="250" src="/images/g1.jpg">
	</div>
	</div>
	</div>
</center>
	</div> 
  <?php
		require_once "blocks/footer.php"
	?>
  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>
  <script>$('.dropdown-button').dropdown({ hover: true}); </script>
  
  </body>
</html>