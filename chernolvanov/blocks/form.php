
<?php
//проверяем, существуют ли переменные в массиве POST
if(!isset($_POST['fio']) and !isset($_POST['email'])){
?>
<div class="row">
    <form class="col s12" action="call.php" method="post">
        <div class="input-field col s12 m6">
          <input id="first_name" name="first_name" type="text" class="validate">
          <label for="first_name">Имя</label>
        </div>
        <div class="input-field col s12 m6">
          <input id="last_name" name="last_name" type="text" class="validate">
          <label for="last_name">Фамилия</label>
        </div>
          <div class="input-field inline col s12">
            <input id="email" name="email" type="email" class="validate">
            <label for="email"  >Электронная почта</label>
          </div>
		  <div class="input-field col s12">
          <textarea id="text" class="materialize-textarea"></textarea>
          <label for="textarea1">Ваше сообщение</label>
        </div>
		<button class="btn waves-effect waves-light" type="submit" name="action">Отправить
		<i class="material-icons right">send</i>
		</button>
    </form>
  </div>

<?php
} else {
//показываем форму
$Fname = $_POST['first_name'];
$Lname = $_POST['last_name'];
$number = $_POST['text'];
$email = $_POST['email'];
$Fname = htmlspecialchars($Fname);
$Lname = htmlspecialchars($Lname);
$number = htmlspecialchars($number);
$email = htmlspecialchars($email);
$Fname = urldecode($Fname);
$Lname = urldecode($Lname);
$number = urldecode($number);
$email = urldecode($email);
$Fname = trim($Fname);
$Lname = trim($Lname);
$number = trim($number);
$email = trim($email);
if (mail("pirieva.marina@mail.ru", "Письмо с сайта", "ФИО:".$Fname." ".$Lname.". Текст сообщения: ".$number.". E-mail: ".$email.". \r\n")){ 
?>

<div class="card-panel light-green lighten-1">
<span class="white-text">Сообщение отправленно!</span>
</div>	
<?php
} else { 
?>

<div class="card-panel red">
<span class="white-text">При отправке произошла ошибка!
</span>
</div>
<?php
}
}
?>
