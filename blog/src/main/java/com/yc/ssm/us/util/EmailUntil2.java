package com.yc.ssm.us.util;
/*package com.yc.blog.util;



import java.io.File;  
import java.util.Date;  
import java.util.Properties;  
  
import javax.activation.DataHandler;  
import javax.activation.DataSource;  
import javax.activation.FileDataSource;  
import javax.mail.BodyPart;  
import javax.mail.Message;  
import javax.mail.Multipart;  
import javax.mail.Session;  
import javax.mail.Transport;  
import javax.mail.internet.InternetAddress;  
import javax.mail.internet.MimeBodyPart;  
import javax.mail.internet.MimeMessage;  
import javax.mail.internet.MimeMultipart;  
  
public class Text2{
    public static final String HOST = "smtp.163.com";
    public static final String PROTOCOL = "smtp";  
    public static final int PORT = 25;
    public static boolean sendMail(String subject, String toMail,String content,String...files) {  
        boolean isFlag = false;  
        try {  
  
            String smtpFromMail = "18773477307@163.com";
            String pwd = "ziupkzexofqavuoo"; 
//        	 String smtpFromMail = "13207343611@163.com";
//             String pwd = "yuan19961025"; 
            int port = 25; 
            String host = "smtp.163.com"; 
  
            Properties props = new Properties();  
            props.put("mail.smtp.host", HOST);
            props.put("mail.store.protocol" , PROTOCOL);
            props.put("mail.smtp.port", PORT);
            props.put("mail.smtp.auth" , true);
            Session session = Session.getDefaultInstance(props);  
            session.setDebug(true);  
  
            MimeMessage message = new MimeMessage(session);  
            try {  
            	message.setFrom(new InternetAddress(smtpFromMail, "永恒"));//发送人的命名
				message.addRecipient(Message.RecipientType.TO,
						new InternetAddress(toMail));
				message.setSubject(subject);
				message.addHeader("charset", "UTF-8");

				 添加正文内容 
				Multipart multipart = new MimeMultipart();
				BodyPart contentPart = new MimeBodyPart();
				contentPart.setText(content);

			//	contentPart.setHeader("Content-Type","text/html; charset=UTF-8");
				multipart.addBodyPart(contentPart);

				 添加附件 
				for (String file : files) {
					File usFile = new File(file);
					MimeBodyPart fileBody = new MimeBodyPart();
					DataSource source = new FileDataSource(file);
					fileBody.setDataHandler(new DataHandler(source));
					sun.misc.BASE64Encoder enc = new sun.misc.BASE64Encoder();
					fileBody.setFileName("附件名称" + enc.encode(usFile.getName().getBytes()) );
					multipart.addBodyPart(fileBody);
				}
				message.setContent(multipart);
				message.setSentDate(new Date());
				message.saveChanges();
				Transport transport = session.getTransport("smtp");

				transport.connect(host, port, smtpFromMail, pwd);
				transport.sendMessage(message, message.getAllRecipients());
				transport.close();
				isFlag = true;
            } catch (Exception e) { 
            	e.printStackTrace();
                isFlag = false;  
            }  
        } catch (Exception e) {  
            e.printStackTrace();  
        }  
        return isFlag;  
    }  
    

	public static void main(String[] args) {
		
		Text2.sendMail("我的javaEmail", "13207343611@163.com", "哈哈 ，终于成功了。。。。","C:\\kms8.log");// 在这里手动设置收件人，也可以建一个类用变量存起来
	}
}
*/