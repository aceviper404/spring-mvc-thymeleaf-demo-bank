package com.demo_bank_v1.config;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.mail.javamail.JavaMailSenderImpl;

public class MailConfig {

	@Bean
	public static JavaMailSenderImpl getMailConfig() {
		JavaMailSenderImpl emailConfig = new JavaMailSenderImpl();
		
		// set properties
		Properties properties = emailConfig.getJavaMailProperties();
		properties.put("mail.transport.protocol", "smtp");
		properties.put("mail.smtp.auth", "true");
		properties.put("mail.smtp.starttls.enable", "true");
		properties.put("mail.debug", "true");
		
		// set mail credentials
		emailConfig.setHost("live.smtp.mailtrap.io");
		emailConfig.setPort(587);
		emailConfig.setUsername("api");
		emailConfig.setPassword("b6e5f86f76711be2b1882b59546aac1e");
		
		return emailConfig;
	}
}
