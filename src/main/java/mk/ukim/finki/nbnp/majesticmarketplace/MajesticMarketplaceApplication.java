package mk.ukim.finki.nbnp.majesticmarketplace;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.context.annotation.Bean;

@SpringBootApplication
public class MajesticMarketplaceApplication {

    public static void main(String[] args) {
        SpringApplication.run(MajesticMarketplaceApplication.class, args);
    }
    @Bean
    public PasswordEncoder passwordEncoder(){
        return new BCryptPasswordEncoder();
    }

}
