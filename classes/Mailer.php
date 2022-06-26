<?php
    require './lib/PHPMailer/src/Exception.php';
    require './lib/PHPMailer/src/PHPMailer.php';
    require './lib/PHPMailer/src/SMTP.php';
    use PHPMailer\PHPMailer\Exception;
    use PHPMailer\PHPMailer\PHPMailer;
 
class Mailer
{
 public function send_email($address,$content){
 try
 {
      $env_mailer_username = getenv("MAILER_LOGIN");
      $env_mailer_pass = getenv("MAILER_PASS");

      $mail = new PHPMailer();
      // var_dump($mail);
      $mail->isSMTP(); // Set mailer to use SMTP
      $mail->Host = 'smtp.poczta.onet.pl'; // Specify main and backup SMTP servers
      $mail->SMTPAuth = true; // Enable SMTP authentication
      $mail->SMTPSecure = 'ssl'; // Enable encryption, 'ssl' also accepted
      $mail->Port = "465";
      $mail->Username = "{$env_mailer_username}"; // SMTP username
      $mail->Password = "{$env_mailer_pass}"; // SMTP password
      $mail->From = "{$env_mailer_username}";
      $mail->FromName = 'Uwierzytelnienie dwuskladnikowe';
      $mail->addAddress($address); // Add a recipient
      $mail->WordWrap = 40; // Set word wrap to 40 characters
      $mail->isHTML(true); // Set email format to HTML
      $mail->Subject = 'Twoj kod bezpieczenstwa';
      $mail->Body = 'Wygenerowano nastepujacy kod: <B>'.$content.'</B>';
      $mail->AltBody = 'Wygenerowano nastepujacy kod: '.$content.'';
   if (!$mail->send())
   {
      echo 'Nie można wysłać wiadomości ';
      echo 'Mailer Error: ' . $mail->ErrorInfo;
      $mail->smtpClose();
   }
   else {
      echo 'Wiadomość została wysłana';
   }
   }catch
   (Exception $e){
      echo "Exception: " . $e->getMessage();
   }
 }
}
