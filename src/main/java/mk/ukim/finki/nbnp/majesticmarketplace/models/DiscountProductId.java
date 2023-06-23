package mk.ukim.finki.nbnp.majesticmarketplace.models;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.Hibernate;

import java.io.Serializable;
import java.util.Objects;

@Getter
@Setter
@Embeddable
public class DiscountProductId implements Serializable {
    private static final long serialVersionUID = 703526892735750240L;
    @Column(name = "discountid", nullable = false)
    private Long discountid;

    @Column(name = "productid", nullable = false)
    private Long productid;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        DiscountProductId entity = (DiscountProductId) o;
        return Objects.equals(this.productid, entity.productid) &&
                Objects.equals(this.discountid, entity.discountid);
    }

    @Override
    public int hashCode() {
        return Objects.hash(productid, discountid);
    }

}