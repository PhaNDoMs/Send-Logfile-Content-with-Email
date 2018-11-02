function sendMail ($mailbody){ 
     #SMTP server name
     $smtpServer = "mail.server.com"

     #Creating a Mail object
     $msg = new-object Net.Mail.MailMessage

     #Creating SMTP server object
     $smtp = new-object Net.Mail.SmtpClient($smtpServer)

     #Email structure
     $msg.From = "Sender@domain.com"
     $msg.ReplyTo = "Sender@domain.com"
     $msg.To.Add("receiver@domain.com")
     $msg.subject = "Automated Log Email"
     $msg.body = $mailbody

     #Sending email
     $smtp.Send($msg)
}
$path = "D:\LogFiles"
Get-ChildItem $path -Filter *.log |
Foreach-Object {
    $fileContent = (Get-Content $_.FullName | Out-String)    
    sendMail $fileContent
}
