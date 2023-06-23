package mk.ukim.finki.nbnp.majesticmarketplace.models.views;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Immutable;

import java.time.Instant;

/**
 * Mapping for DB view
 */
@Getter
@Setter
@Entity
@Immutable
@Table(name = "order_view")
public class OrderView {
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "userid")
    private Long userid;

    @Column(name = "first_name", length = 20)
    private String firstName;

    @Column(name = "last_name", length = 20)
    private String lastName;

    @Column(name = "total_cost")
    private Float totalCost;

    @Column(name = "created_timestamp")
    private Instant createdTimestamp;

    @Column(name = "status_type")
    private String statusType;

    @Column(name = "shopping_cart_id")
    private Long shoppingCartId;

}