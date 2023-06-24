package mk.ukim.finki.nbnp.majesticmarketplace.repositories;

import mk.ukim.finki.nbnp.majesticmarketplace.models.User;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.stereotype.Repository;

@Repository
public interface UserRepository extends JpaRepository<User,Long> {
    @Query("SELECT register_user(:username,:password,:email,:name, :surname)")
    void register(String username,String password,String email,String name,String surname);

    @Query("SELECT user_login(:username,:password)")
    void login(String username,String password);

    
}
