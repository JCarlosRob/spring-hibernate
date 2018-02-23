package springHibernate.config;

import java.beans.PropertyVetoException;
import java.io.IOException;
import java.util.Properties;

import javax.sql.DataSource;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.core.env.Environment;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.mchange.v2.c3p0.ComboPooledDataSource;

@Configuration
@EnableTransactionManagement
@PropertySource("resources/properties/app.properties")
public class HibernateConfig {

	@Autowired
	private Environment env;
	
	@Bean
	public HibernateTemplate hibernateTemplate() {
		
		return new HibernateTemplate(sessionFactory());
		
	}
	
	@Bean
	public HibernateTransactionManager hibernateTransactionManager() {
		
		return new HibernateTransactionManager(sessionFactory());
		
	}
	
	@Bean
	public SessionFactory sessionFactory() {
		
		LocalSessionFactoryBean sessionFactory = new LocalSessionFactoryBean();
		
		sessionFactory.setDataSource(dataSource());
		sessionFactory.setPackagesToScan("springHibernate.entity");
		sessionFactory.setHibernateProperties(hibernateProperties());
		
		try {
			
			sessionFactory.afterPropertiesSet();
		
		} catch (IOException e) {

			e.printStackTrace();
		
		}
		
		return sessionFactory.getObject();
		
	}
	
	@Bean 
	public DataSource dataSource() {
		
		ComboPooledDataSource dataSource = new ComboPooledDataSource();
		
		try {
			
			dataSource.setDriverClass(env.getProperty("hibernate.driver"));
		
		} catch (PropertyVetoException e) {

			e.printStackTrace();
		
		}
		dataSource.setJdbcUrl(env.getProperty("hibernate.url"));
		dataSource.setUser(env.getProperty("hibernate.user"));
		dataSource.setPassword(env.getProperty("hibernate.password"));
		
		dataSource.setInitialPoolSize(
				Integer.parseInt(env.getProperty("pool.initialPoolSize")));
		dataSource.setMinPoolSize(
				Integer.parseInt(env.getProperty("pool.minPoolSize")));
		dataSource.setMaxPoolSize(
				Integer.parseInt(env.getProperty("pool.maxPoolSize")));
		dataSource.setMaxIdleTime(
				Integer.parseInt(env.getProperty("pool.maxIdleTime")));
		
		return dataSource;
		
	}
	
	private Properties hibernateProperties() {
		
		Properties properties = new Properties();
		
		properties.setProperty("hibernate.dialect", env.getProperty("hibernate.dialect"));
		properties.setProperty("hibernate.show_sql", env.getProperty("hibernate.show_sql"));
		properties.setProperty("hibernate.format_sql", env.getProperty("hibernate.format_sql"));
		
		return properties;
		
	}
	
	
}
