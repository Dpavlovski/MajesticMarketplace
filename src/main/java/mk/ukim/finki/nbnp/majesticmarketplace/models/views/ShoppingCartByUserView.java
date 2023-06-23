package mk.ukim.finki.nbnp.majesticmarketplace.models.views;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Immutable;

/**
 * Mapping for DB view
 */
@Getter
@Setter
@Entity
@Immutable
@Table(name = "shopping_cart_by_user_view")
public class ShoppingCartByUserView {
    @Id
    @Column(name = "cart_id")
    private Long cartId;

    @Column(name = "user_id")
    private Long userId;

    @Column(name = "product_id")
    private Long productId;

    @Column(name = "quantity")
    private Short quantity;

    @Column(name = "name", length = 100)
    private String name;

    @Column(name = "price")
    private Integer price;

}