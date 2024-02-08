package mk.ukim.finki.nbnp.majesticmarketplace.services;

import mk.ukim.finki.nbnp.majesticmarketplace.models.User;
import mk.ukim.finki.nbnp.majesticmarketplace.repositories.UserRepository;
import org.springframework.stereotype.Service;
import org.thymeleaf.util.StringUtils;

import javax.security.auth.login.CredentialException;

@Service
public class AuthServiceImpl {

    private final UserRepository userRepository;

    public AuthServiceImpl(UserRepository userRepository) {
        this.userRepository = userRepository;
    }

    public User login(String username, String password) throws CredentialException {
        if (StringUtils.isEmpty(username) || StringUtils.isEmpty(password)) {
            throw new IllegalArgumentException();
        }
        if (userRepository.login(username, password) == null)
            throw new CredentialException();
        return userRepository.login(username, password);
    }
}