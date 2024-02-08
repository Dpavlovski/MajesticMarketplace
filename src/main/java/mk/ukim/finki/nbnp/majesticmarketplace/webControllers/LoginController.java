package mk.ukim.finki.nbnp.majesticmarketplace.webControllers;

import jakarta.servlet.http.HttpServletRequest;
import mk.ukim.finki.nbnp.majesticmarketplace.models.User;
import mk.ukim.finki.nbnp.majesticmarketplace.services.AuthServiceImpl;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import javax.security.auth.login.CredentialException;

@Controller
@RequestMapping
public class LoginController {

    private final AuthServiceImpl authService;

    public LoginController(AuthServiceImpl authService) {
        this.authService = authService;
    }

    @GetMapping("/login")
    public String getLoginPage(Model model) {
        model.addAttribute("bodyContent", "login");
        return "layout";
    }

    @PostMapping("/login/custom_login")
    public String login(@RequestParam String username, @RequestParam String password, Model model, HttpServletRequest request) {
        User user = null;
        try {
            user = this.authService.login(username, password);
            request.getSession().setAttribute("user", user);
            return "redirect:/products";
        } catch (CredentialException exception) {
            model.addAttribute("hasError", true);
            model.addAttribute("error", exception.getMessage());
            return "login";
        }
    }
}
