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
@Table(name = "order_user_view")
public class OrderUserView {
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "total_cost")
    private Float totalCost;

    @Column(name = "product_id")
    private Long productId;

    @Column(name = "name", length = 100)
    private String name;

    @Column(name = "created_timestamp")
    private Instant createdTimestamp;

    @Column(name = "username", length = 20)
    private String username;

    @Column(name = "email", length = 64)
    private String email;

}