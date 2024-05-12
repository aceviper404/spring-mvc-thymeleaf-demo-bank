package com.demo_bank_v1.mailMessenger;

import javax.mail.MessagingException;
import javax.mail.internet.MimeMessage;

import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;

import com.demo_bank_v1.config.MailConfig;

public class MailMessenger {
	
	public static void htmlEmailMessenger(String from, String toMail, String subject, String body) throws MessagingException {
		// get mail config
		JavaMailSender sender = MailConfig.getMailConfig();
		// get mime message
		MimeMessage message = sender.createMimeMessage();
		// set mime message helper
		MimeMessageHelper htmlHelper = new MimeMessageHelper(message, true);
		
		// set mail attributes
		htmlHelper.setTo(toMail);
		htmlHelper.setFrom(from);
		htmlHelper.setSubject(subject);
		htmlHelper.setText(body, true);
		// send message
		sender.send(message);
	}

}
