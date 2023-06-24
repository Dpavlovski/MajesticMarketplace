package mk.ukim.finki.nbnp.majesticmarketplace.repositories;

import mk.ukim.finki.nbnp.majesticmarketplace.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {
    @Procedure(name = "register_user")
    void register(@Param("username") String username, @Param("password") String password, @Param("email") String email, @Param("name") String name, @Param("surname") String surname);

    @Procedure(name = "login_user")
    void login(@Param("username") String username,@Param("password") String password);

    
}
