package mk.ukim.finki.nbnp.majesticmarketplace.webControllers;

import lombok.AllArgsConstructor;
import mk.ukim.finki.nbnp.majesticmarketplace.services.UserService;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

@RestController
@AllArgsConstructor
@RequestMapping("/api/users")
public class UserController {
    private final UserService userService;
    @PostMapping("/register")
    public void register(@RequestParam String username, @RequestParam String password, @RequestParam String email, @RequestParam String name, @RequestParam String surname){
        userService.register(username,password,email,name,surname);
    }


}
