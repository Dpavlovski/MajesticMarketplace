package mk.ukim.finki.nbnp.majesticmarketplace.repositories;

import jakarta.transaction.Transactional;
import mk.ukim.finki.nbnp.majesticmarketplace.models.Shoppingcart;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Modifying;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

public interface ShoppingCartRepository extends JpaRepository<Shoppingcart, Long> {
    @Modifying
    @Transactional
    @Query(value = "CALL add_product_to_cart(:cart_id, :product_id, :quantity)", nativeQuery = true)
    void addShoppingCartItem(@Param("cart_id") Long cart_id, @Param("product_id") Long product_id, @Param("quantity") Short quantity);

    @Modifying
    @Transactional
    @Query(value = "CALL delete_shopping_cart_item(:product_id)", nativeQuery = true)
    void deleteShoppingCartItem(@Param("product_id") Long product_id);
}
