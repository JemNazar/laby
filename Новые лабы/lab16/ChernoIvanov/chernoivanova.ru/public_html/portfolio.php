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
<div class="card">
 <ul class="collection with-header">
        <li class="collection-header"><h4>Черноиванова Марал Атамурадовна</h4></li>
        <li class="collection-item"><b>Дата рождения:</b> 17.01.1986</li>
        <li class="collection-item"><b>Место рождения:</b> Тюмень</li>
		<li class="collection-header"><h5>Образование:</h5></li>
        <li class="collection-item">1. Тюменский государственный нефтегазовый университет, инженер по специальности «Разработка и эксплуатация нефтяных и газовых месторождений», 2010 год.</li>
        <li class="collection-item">2. Тюменский государственный нефтегазовый университет, преподаватель высшей школы, 2013 год.</li>
		<li class="collection-header"><b>Место работы:</b> Многопрофильный колледж имени Ю.Г.Эрвье ТИУ</li>
		<li class="collection-item"><b>Должность:</b> преподаватель</li>
		<li class="collection-item"><b>Квалификационная категория:</b> высшая</li>
		<li class="collection-item"><b>Педагогический стаж:</b> 7,5 лет</li>
      </ul>
<center><video width="100%" src="video/Prepod_goda.mp4" controls	></video></center>
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
