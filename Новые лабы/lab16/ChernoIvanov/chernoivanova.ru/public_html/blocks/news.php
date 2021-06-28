<?php 
$news = getAll("news");
$title = $news[count($news)-1]["title"];
$text = $news[count($news)-1]["text"];
$rang = $news[count($news)-1]["rang"];
if ($rang) {
if ($rang == 1){
 ?>
<div class="card red">
	 <div class="card-content white-text">
		  <?php echo $title; echo '<br>'; echo $text ?>
		  <a class="waves-effect waves-black right btn white red-text" href="news.php">Все новости</a>
	</div>
</div>
<?php 
		}
else if ($rang == 2) {
?>
<div class="card light-green lighten-1">
	 <div class="card-content white-text">
		  <?php echo $title; echo '<br>'; echo $text ?>
		  <a class="waves-effect waves-black right btn white light-green-text lighten-1" href="news.php">Все новости</a>
	</div>
</div>
<?php 
		}
else {
?>
<div class="card blue">
	 <div class="card-content white-text">
		  <?php echo $title; echo '<br>'; echo $text ?>
		  <a class="waves-effect waves-black right btn white blue-text" href="news.php">Все новости</a>
	</div>
</div>
<?php }}?>
