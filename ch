//    SBI Core Banking Project, Kondapur, Hyderabad, India.       *
//*****************************************************************
//                                                                *
//  	           PROGRAM - OpenBankingServicesApp.Java                *
//                                                                *
//*****************************************************************
//                 P R O G R A M    H I S T O R Y                 *
//                                                                *
//   PROGRAMMER    :    DATE       :  SPR NO   :   COMMENTS       *
//----------------------------------------------------------------*
// Naga Sai Ganesh : 15/10/2024    : 24090001  :  MICROSERVICES   *
//----------------------------------------------------------------*

package com.tcs.bancs.microservices;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.boot.autoconfigure.domain.EntityScan;
import org.springframework.boot.autoconfigure.jdbc.DataSourceAutoConfiguration;
import org.springframework.boot.autoconfigure.jdbc.DataSourceTransactionManagerAutoConfiguration;
import org.springframework.boot.builder.SpringApplicationBuilder;
import org.springframework.boot.web.servlet.support.SpringBootServletInitializer;
import org.springframework.context.annotation.ComponentScan;
import org.springframework.context.annotation.Import;
//import org.springframework.data.jpa.repository.config.EnableJpaRepositories;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;

import com.tcs.bancs.microservices.config.CBSDayDbConfig;
import com.tcs.bancs.microservices.config.CBSNightDbConfig;
import com.tcs.bancs.microservices.config.CBSRefDbConfig;
import springfox.documentation.swagger2.annotations.EnableSwagger2;

@SpringBootApplication
(exclude = { DataSourceAutoConfiguration.class, // HibernateJpaAutoConfiguration.class,
		DataSourceTransactionManagerAutoConfiguration.class },
scanBasePackages = "com.tcs.bancs.microservices")
@EnableJpaRepositories("com.tcs.bancs.microservices.repository")
@EntityScan("com.tcs.bancs.microservices.entity")
@ComponentScan(basePackages = { "com.tcs.bancs.microservices", "com.tcs.bancs.microservices.config",
		"com.tcs.bancs.api", "com.tcs.bancs.microservices.interceptor", "com.tcs.bancs.microservices.api",
		"com.tcs.bancs.microservices.model", "com.tcs.bancs.microservices.util", "com.tcs.bancs.microservices",
		"com.tcs.bancs.microservices.impl", "com.tcs.bancs.microservices.repository.day",
		"com.tcs.bancs.microservices.repository.night", "com.tcs.bancs.microservices.repository.ref",
		"com.tcs.bancs.microservices.exception", "com.tcs.bancs.microservices.mappings",
		"com.tcs.bancs.microservices.model" })
@EnableSwagger2
@Import({ CBSDayDbConfig.class, CBSNightDbConfig.class, CBSRefDbConfig.class })
public class OpenBankingServicesApp extends SpringBootServletInitializer {
	private static Logger LOGGER = LoggerFactory.getLogger(OpenBankingServicesApp.class);

	public static void main(String[] args) {

		if (System.getProperty("ChannelsPropConfigPath") == null) {
			LOGGER.info(
					"Path to config property file is not set! Please set the system variable \"ChannelsPropConfigPath\" with the path to the config file.");
			LOGGER.info("Execution Finished with Error!");
		}

		SpringApplication.run(OpenBankingServicesApp.class, args);

	}

	protected SpringApplicationBuilder configure(SpringApplicationBuilder builder) {
		return builder.sources(OpenBankingServicesApp.class);
	}

}
