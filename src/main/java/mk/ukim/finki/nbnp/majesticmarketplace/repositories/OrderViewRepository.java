package mk.ukim.finki.nbnp.majesticmarketplace.repositories;

import mk.ukim.finki.nbnp.majesticmarketplace.models.views.OrderUserView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;

public interface OrderViewRepository extends JpaRepository<OrderUserView, Long> {

    @Query(value = "SELECT * FROM show_user_order()",nativeQuery = true)
    List<OrderUserView> getOrderByUser();
}
