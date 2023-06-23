package mk.ukim.finki.nbnp.majesticmarketplace.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "discountcode_order")
public class DiscountcodeOrder {
    @EmbeddedId
    private DiscountcodeOrderId id;

    @MapsId("discountcodeid")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "discountcodeid", nullable = false)
    private Discountcode discountcodeid;

    @MapsId("orderid")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "orderid", nullable = false)
    private Order orderid;

}