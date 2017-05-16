package com.sang.topic.util;

import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

public class JavaMailUtil {
	public static void sendEmail(String host, String form, String to, String subject, String body, 
            final String username, final String password){
		    Properties properties = System.getProperties();
		    //服务器  qq或者163
		    properties.put("mail.smtp.host", host);
		    properties.put("mail.smtp.auth", "true");
		    //授权账号密码验证
		    Session session = Session.getDefaultInstance(properties, new Authenticator() {
	            @Override
	            public PasswordAuthentication getPasswordAuthentication(){
	                return new PasswordAuthentication(username, password);
	            }
	        });
            try {
                //创建邮件
    		    MimeMessage message=new MimeMessage(session);
    		    //发件人信息
    		    message.setFrom(new InternetAddress(form));
    		    //发送类型 TO直接发送   cc抄送  Bcc密送
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
                //邮件标题
                message.setSubject(subject);
                //邮件内容
                message.setText(body);
                //发送邮件
				Transport.send(message);
			} catch (MessagingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		    
	};
	
	//测试方法  从18970987553@163.com发送随机验证码到 952468926@qq.com
	public static void main(String[] args) {
		//选择发送的主机邮箱
		String host="smtp.163.com";
		//从哪个邮箱发送
		String form="18970987553@163.com";
		
		String subject="找回密码";
		//随机生成的验证码，  RandomChar这个是自己写的随机生成验证码的类
		String body=RandomChar.getRandomALLChar(4);
		//发送到哪个邮箱
		String to="952468926@qq.com";
		//以哪个邮箱发送
		String username="18970987553@163.com";
		//这个是权限密码，有了这个可以直接用下面的方法发送邮箱，而不需要登录再发送了
		String password="wzt3050317";
		//发送验证码到邮箱
		sendEmail(host, form, to, subject, body, username, password);
	}

}
