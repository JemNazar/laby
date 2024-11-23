<!DOCTYPE html>
<html lang="en">
<head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
  <meta name="viewport" content="width=device-width, initial-scale=1, maximum-scale=1.0"/>
  <title>Обратная связь</title>

  <!-- CSS  -->
  <link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
  <link href="css/materialize.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <link href="css/style.css" type="text/css" rel="stylesheet" media="screen,projection"/>
  <!-- Put this script tag to the <head> of your page -->
<script type="text/javascript" src="//vk.com/js/api/openapi.js?152"></script>

<script type="text/javascript">
  VK.init({apiId: 6415763, onlyWidgets: true});
</script>



</head>
<body>
  <?php
		require_once "blocks/headerL.php"
	?>
<div class="container">
<h4 class="blue-text ">Обратная связь</h4>
	<div class="row">
  <br>
  <ul class="collapsible popout " data-collapsible="accordion">
    <li>
      <div class="collapsible-header active"><i class="material-icons">mail</i>Напишите мне</div>
      <div class="collapsible-body">
	  <?php
		require_once "blocks/form.php"
		?>
	</div>
    </li>
    <li>
      <div class="collapsible-header">Комментарии</div>
      <div class="collapsible-body"><span>
          <!-- Put this div tag to the place, where the Comments block will be -->
<div id="vk_comments"></div>
<script type="text/javascript">
VK.Widgets.Comments("vk_comments", {limit: 15, attach: false});
</script>
		</span></div>
    </li>
  </ul>
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