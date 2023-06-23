//package mk.ukim.finki.nbnp.majesticmarketplace.models.Security;
//
//
//import org.springframework.beans.factory.annotation.Autowired;
//import org.springframework.context.annotation.Configuration;
//
//
//@Configuration
//public class SecurityConfig extends WebSecurityConfigurerAdapter {
//    @Autowired
//    private final PasswordEncoder passwordEncoder;
//
//    @Autowired
//    private final UserDetailsService userDetailsService;
//
//    public SecurityConfig(PasswordEncoder passwordEncoder, UserDetailsService userDetailsService) {
//        this.passwordEncoder = passwordEncoder;
//        this.userDetailsService = userDetailsService;
//    }
//    @Override
//    public void configure(WebSecurity web) throws Exception {
//        web.ignoring().antMatchers("/h2**"); // do not remove this line
//
//        // TODO: If you are implementing the security requirements, remove this following line
////        web.ignoring().antMatchers("/**");
//    }
//
//    @Override
//    protected void configure(HttpSecurity http) throws Exception {
//
//        http.csrf().disable()
//                .authorizeRequests()
//                .antMatchers("/", "/login", "/players").permitAll()
//                .antMatchers("/players/**/vote").hasAnyRole("ADMIN", "USER")
//                .anyRequest().hasRole("ADMIN")
//                .and()
//                .formLogin()
//                .failureUrl("/login?error=BadCredentials")
//                .defaultSuccessUrl("/players", true)
//                .and()
//                .logout()
//                .logoutUrl("/logout")
//                .clearAuthentication(true)
//                .invalidateHttpSession(true)
//                .deleteCookies("JSESSIONID")
//                .logoutSuccessUrl("/");
//
//    }
//
//    @Override
//    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
//        auth.inMemoryAuthentication()
//                .withUser("user")
//                .password(passwordEncoder.encode("user"))
//                .authorities("ROLE_USER")
//                .and()
//                .withUser("admin")
//                .password(passwordEncoder.encode("admin"))
//                .authorities("ROLE_ADMIN");
//        //auth.authenticationProvider(authenticationProvider);
//    }
//
//}
