package mk.ukim.finki.nbnp.majesticmarketplace.repositories;

import mk.ukim.finki.nbnp.majesticmarketplace.models.views.ShoppingCartByUserView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ShoppingCartRepository extends JpaRepository<ShoppingCartByUserView,Long> {

    @Query(value = "SELECT * FROM user_shopping_cart_items()",nativeQuery = true)
    List<ShoppingCartByUserView> getShoppingCartByUser();

    @Query(value = "SELECT * FROM add_product_to_cart(:productId,:quantity)",nativeQuery = true)
    void addShoppingCartItem(@Param("productId") Long productId, @Param("quantity") Short quantity);
}
