package mk.ukim.finki.nbnp.majesticmarketplace.repositories;

import mk.ukim.finki.nbnp.majesticmarketplace.models.Order;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

public interface OrderRepository extends JpaRepository<Order, Long> {

    @Query(value = "SELECT * FROM create_order()",nativeQuery = true)
    boolean createOrder();
}
