<!DOCTYPE html>
<html lang="ru">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Черноиванова Марал Атамурадовна</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
</head>
<body>
  <?php
		require_once "blocks/header.php"
	?>
	
	<div class="container">
  <div class="section no-pad-bot" id="index-banner">

      </div>
      <div class="row">
	   <div class="col s12 l6">
	       <div class="card-content">
	   <div class="card-image">
        <img src="/images/MP3.jpg" width="100%" >
      </div>
       </div>
      </div>
      <div class="col s12 l6">
    <div class="card">
         <div class="card-content">
		<blockquote><h4><center>"Педагог - это инженер<br>человеческих душ."<br></center></h4><p  align="right"> - М. И. Калинин</p></blockquote>
		<blockquote><h4><center>"Быстрее и лучше всего учиться, когда учишь других."<br></center></h4><p  align="right"> -  Роза Люксембург</p></blockquote>
    </div>
    </div>
  </div>
  </div>
	<div class="row"><div class="card">
	<center><video width="100%" src="video/Prepod_goda.mp4" controls	></video></center>
	  </div></div>
    
</div>	 
  <?php
		require_once "blocks/footer.php"
	?>
  <!--  Scripts-->
  <script src="https://code.jquery.com/jquery-2.1.1.min.js"></script>
  <script src="js/materialize.js"></script>
  <script src="js/init.js"></script>
  <script>$('.dropdown-button').dropdown({ hover: true}); </script>
  <script>$('.carousel.carousel-slider').carousel({fullWidth: true,
  duration: 100,
  indicators: true});</script>
  </body>
</html>