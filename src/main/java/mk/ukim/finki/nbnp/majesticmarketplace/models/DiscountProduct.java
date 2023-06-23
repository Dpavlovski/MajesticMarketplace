package mk.ukim.finki.nbnp.majesticmarketplace.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "discount_product")
public class DiscountProduct {
    @EmbeddedId
    private DiscountProductId id;

    @MapsId("discountid")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "discountid", nullable = false)
    private Discount discountid;

    @MapsId("productid")
    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "productid", nullable = false)
    private Product productid;

}