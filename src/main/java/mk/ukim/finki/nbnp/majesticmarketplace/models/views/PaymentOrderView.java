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
@Table(name = "payment_order_view")
public class PaymentOrderView {
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "created_timestamp")
    private Instant createdTimestamp;

    @Column(name = "order_id")
    private Long orderId;

    @Column(name = "total_cost")
    private Float totalCost;

}