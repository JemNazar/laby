<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Публикации</title>
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
<h4 class="blue-text ">Публикации</h4>

	<div class="row">
	<ul class="collection">

   
	<li class="collection-item avatar">
      <i class="material-icons circle red">book</i>
      <span class="title">Личность и общество в современной культуре</span>
		<br>материалы Международной научно-практической конференции 25 сентября 2017 года
	  <br>
	  <a href="https://docs.google.com/viewerng/viewer?url=<?php echo ''.$_SERVER['HTTP_HOST']; ?>/files/Lichnost_i_obschestvo_v_sovremennoy_kulture.pdf"  target="_blank" class="secondary-content"><i class="material-icons">import_contacts</i></a>
    </li>
	</ul>
	<center>
	<div class="col l4 s12">
	<div class="card">
	<img class="materialboxed" width="250" src="/images/pub/p1.jpg">
	</div>
	</div>
	<div class="col l4 s12">
	<div class="card">
	<img class="materialboxed" width="250" src="/images/pub/p2.jpg">
	</div>
	</div>
	<div class="col l4 s12">
	<div class="card">
	<img class="materialboxed" width="250" src="/images/pub/p3.jpg">
	</div>
	</div>
	<div class="card col l12 s12">
	<img class="materialboxed col l4 s12" width="250" src="/images/pub/p4-1.jpg">
	<img class="materialboxed col l4 s12" width="250" src="/images/pub/p4-2.jpg">
	<img class="materialboxed col l4 s12" width="250" src="/images/pub/p4-3.jpg">
	</div>
	<div class="card col l12 s12">
	<img class="materialboxed col l6 s12" width="250" src="/images/pub/p5-1.jpg">
	<img class="materialboxed col l6 s12" width="250" src="/images/pub/p5-2.jpg">
	</div>
	<div class="card col l12 s12">
	<img class="materialboxed col l6 s12" width="250" src="/images/pub/p6-1.jpg">
	<img class="materialboxed col l6 s12" width="250" src="/images/pub/p6-2.jpg">
	</div>
	<div class="card col l12 s12">
	<img class="materialboxed col l4 s12" width="250" src="/images/pub/p7-1.jpg">
	<img class="materialboxed col l4 s12" width="250" src="/images/pub/p7-2.jpg">
	<img class="materialboxed col l4 s12" width="250" src="/images/pub/p7-3.jpg">
	</div>
	<div class="col l4 s12">
	<div class="card">
	<img class="materialboxed" width="250" src="/images/pub/p8.jpg">
	</div>
	</div>
	<div class="col l4 s12">
	<div class="card">
	<img class="materialboxed" width="250" src="/images/pub/p9.jpg">
	</div>
	</div>
	<div class="col l4 s12">
	<div class="card">
	<img class="materialboxed" width="250" src="/images/pub/p10.jpg">
	</div>
	</div>
	<div class="col l4 s12">
	<div class="card">
	<img class="materialboxed" width="250" src="/images/pub/p11.jpg">
	</div>
	</div>
	</center>
	</div>
	</div>

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