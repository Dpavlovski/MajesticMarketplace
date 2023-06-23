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
public class DiscountcodeOrderId implements Serializable {
    private static final long serialVersionUID = 6904810402010618432L;
    @Column(name = "discountcodeid", nullable = false)
    private Long discountcodeid;

    @Column(name = "orderid", nullable = false)
    private Long orderid;

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || Hibernate.getClass(this) != Hibernate.getClass(o)) return false;
        DiscountcodeOrderId entity = (DiscountcodeOrderId) o;
        return Objects.equals(this.discountcodeid, entity.discountcodeid) &&
                Objects.equals(this.orderid, entity.orderid);
    }

    @Override
    public int hashCode() {
        return Objects.hash(discountcodeid, orderid);
    }

}