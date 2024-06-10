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

        http.authorizeHttpRequests((auth) -> {
                    auth   // URL access control
                            .requestMatchers("/resources/**", "/controllerjs/**", "/styles/**", "/bootstrap-5.3.2/**", "/image/**").permitAll()
                            .requestMatchers("/login").permitAll()
                            .requestMatchers("/createadminuser").permitAll()
                            .requestMatchers("/dashboard/**").hasAnyAuthority("Admin", "Manager", "Cashier", "Store-Manager")
                            .requestMatchers("/employee/**").hasAnyAuthority("Admin", "Manager")
                            .requestMatchers("/privilege/**").hasAnyAuthority("Admin")
                            .requestMatchers("/user/**").hasAnyAuthority("Admin", "Manager")
                            .requestMatchers("/item/**").hasAnyAuthority("Admin", "Manager", "Cashier", "Store-Manager")
                            .anyRequest().authenticated();
                })
                // Login details
                .formLogin((login) -> {
                    login
                            .loginPage("/login")  // Login page
                            .usernameParameter("username")  // Username field name
                            .passwordParameter("password")  // Password field name
                            .defaultSuccessUrl("/settings", true)  // Login success URL
                            .failureUrl("/login?error=invalidusernamepassword");  // Login failure URL
                })
                // Logout details
                .logout((logout) -> {
                    logout
                            .logoutUrl("/logout")  // Logout request matching
                            .logoutSuccessUrl("/login");  // After logout change URL to login
                })
                // Cross site access disable
                .csrf(csrf -> csrf.disable())
                // Exception handling
                .exceptionHandling(exp -> exp.accessDeniedPage("/error"));

        return http.build();
    }

    @Bean
    public BCryptPasswordEncoder bCryptPasswordEncoder() {
        return new BCryptPasswordEncoder();
    }
}
