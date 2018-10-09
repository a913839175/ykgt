package com.huarong.framework.config;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.http.converter.HttpMessageConverter;
import org.springframework.http.converter.json.MappingJackson2HttpMessageConverter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;
import org.springframework.web.multipart.MultipartResolver;
import org.springframework.web.multipart.support.StandardServletMultipartResolver;
import org.springframework.web.servlet.config.annotation.CorsRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurerAdapter;

import com.fasterxml.jackson.databind.DeserializationFeature;
import com.fasterxml.jackson.databind.ObjectMapper;

@Configuration
public class MyWebMvcConfigurerAdapter extends WebMvcConfigurerAdapter {

	/**
	 * 配置静态访问资源
	 * 
	 * @param registry
	 */
	// @Override
	// public void addResourceHandlers(ResourceHandlerRegistry registry) {
	// //自定义项目内目录
	// //registry.addResourceHandler("/my/**").addResourceLocations("classpath:/my/");
	// //指向外部目录
	// //registry.addResourceHandler("/my/**").addResourceLocations("file:E:/my/");
	//   super.addResourceHandlers(registry);
	// }

	/**
	 * 以前要访问一个页面需要先创建个Controller控制类，在写方法跳转到页面
	 * 在这里配置后就不需要那么麻烦了，直接访问http://localhost:8080/toLogin就跳转到login.html页面了
	 *
	 * @param registry
	 */
	// @Override
	// public void addViewControllers(ViewControllerRegistry registry) {
	// registry.addViewController("/toLogin").setViewName("login");
	// super.addViewControllers(registry);
	// }

	/**
	 * 拦截器
	 * 
	 * @param registry
	 */
	// @Override
	// public void addInterceptors(InterceptorRegistry registry) {
	// // addPathPatterns 用于添加拦截规则
	// // excludePathPatterns 用户排除拦截
	// registry.addInterceptor(new
	// MyInterceptor()).addPathPatterns("/**").excludePathPatterns("/toLogin","/login","/**");
	// super.addInterceptors(registry);
	// }
	private CorsConfiguration buildConfig() {
		 CorsConfiguration corsConfiguration = new CorsConfiguration();
		 List<String> list = new ArrayList<>();
		 list.add("*");
		 corsConfiguration.setAllowedOrigins(list);
		 /*
		    // 请求常用的三种配置，*代表允许所有，当时你也可以自定义属性（比如header只能带什么，只能是post方式等等）
		    */
         corsConfiguration.addAllowedOrigin("*");  
		 corsConfiguration.addAllowedHeader("*"); 
		 corsConfiguration.addAllowedMethod("*"); 
		 return corsConfiguration;
	}
	@Bean
	public CorsFilter corsFilter() {
	  UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
	  source.registerCorsConfiguration("/**", buildConfig());
	  return new CorsFilter(source);
	}
	@Override
	public void addCorsMappings(CorsRegistry registry) {
		registry.addMapping("/**")
//				.allowedOrigins("http://weipaidai.com")
				.allowedMethods("POST", "GET", "PUT", "PATCH", "OPTIONS", "DELETE")
				.allowedHeaders("origin", "content-type", "accept", "x-requested-with")
				.exposedHeaders("origin", "content-type", "accept", "x-requested-with")
				.exposedHeaders("origin", "content-type", "accept", "x-requested-with")
				.allowCredentials(false)
				.allowedOrigins("*")
				.maxAge(3600);
		// registry.addMapping("/**");
	}

	/**
	 * 配置fastJson
	 * 
	 * @param converters
	 */
	@Override
	public void configureMessageConverters(List<HttpMessageConverter<?>> converters) {
		// FastJsonHttpMessageConverter fastConverter = new
		// FastJsonHttpMessageConverter();
		// FastJsonConfig fastJsonConfig = new FastJsonConfig();
		// fastJsonConfig.setSerializerFeatures(SerializerFeature.PrettyFormat);
		// fastConverter.setFastJsonConfig(fastJsonConfig);
		converters.add(mappingJackson2HttpMessageConverter());
		super.configureMessageConverters(converters);
	}

	@Bean
	public MappingJackson2HttpMessageConverter mappingJackson2HttpMessageConverter() {
		MappingJackson2HttpMessageConverter jsonConverter = new MappingJackson2HttpMessageConverter();
		ObjectMapper objectMapper = new ObjectMapper();
		objectMapper.configure(DeserializationFeature.FAIL_ON_UNKNOWN_PROPERTIES, false);
		objectMapper.configure(DeserializationFeature.FAIL_ON_NUMBERS_FOR_ENUMS, false);
		jsonConverter.setObjectMapper(objectMapper);
		return jsonConverter;
	}

	@Bean
	public MultipartResolver multipartResolver() throws IOException {
		return new StandardServletMultipartResolver();
	}

}
