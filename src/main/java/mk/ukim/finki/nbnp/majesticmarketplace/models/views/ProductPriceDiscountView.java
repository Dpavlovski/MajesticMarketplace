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
@Table(name = "product_price_discount_view")
public class ProductPriceDiscountView {
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "name", length = 100)
    private String name;

    @Column(name = "price")
    private Integer price;

    @Column(name = "amount")
    private Integer amount;

}