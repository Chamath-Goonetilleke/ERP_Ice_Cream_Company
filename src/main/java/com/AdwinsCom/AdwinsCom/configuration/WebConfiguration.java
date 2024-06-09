package com.AdwinsCom.AdwinsCom.configuration;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;

@Configuration
@EnableWebSecurity
public class WebConfiguration {

    @Bean
    public SecurityFilterChain filterChain(HttpSecurity http) throws Exception {

        // give access database roles
        http.authorizeHttpRequests((auth)->{
            auth   // url access control
            .requestMatchers("/resources/**","/controllerjs/**").permitAll()
            .requestMatchers("/login").permitAll()
            .requestMatchers("/createadminuser").permitAll()
            .requestMatchers("/dashboard/**").hasAnyAuthority("Admin","Manager","Cashier","Store-Manager")
            .requestMatchers("/employee/**").hasAnyAuthority("Admin","Manager")
            .requestMatchers("/privilege/**").hasAnyAuthority("Admin")
            .requestMatchers("/user/**").hasAnyAuthority("Admin","Manager")
            .requestMatchers("/item/**").hasAnyAuthority("Admin","Manager","Cashier","Store-Manager")
            .anyRequest().authenticated();
            
        })
        // login details
        .formLogin((login)->{
            login
            .loginPage("/login")     // login page
            .usernameParameter("username")    // username field name value
            .passwordParameter("password")     // password field name value  
            .defaultSuccessUrl("/settings", true)    // login success url
            .failureUrl("/login?error=invalidusernamepassword");    // login failure url

        })
        // logout details
        .logout((logout)->{
            logout
            .logoutUrl("/logout")   // logout request matching
            .logoutSuccessUrl("/login");   // after logout change url into login
        })
        // cross site access disable
        .csrf(csrf -> csrf.disable())
        // exception handling
        .exceptionHandling(exp -> exp.accessDeniedPage("/error"));

        return http.build();
    }


    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {

        return new BCryptPasswordEncoder();
    }
}
