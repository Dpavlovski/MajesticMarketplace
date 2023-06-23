package mk.ukim.finki.nbnp.majesticmarketplace.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.OnDelete;
import org.hibernate.annotations.OnDeleteAction;

import java.time.Instant;

@Getter
@Setter
@Entity
@Table(name = "productprice")
public class Productprice {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "price", nullable = false)
    private Integer price;

    @Column(name = "valid_from", nullable = false)
    private Instant validFrom;

    @Column(name = "valid_till", nullable = false)
    private Instant validTill;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @OnDelete(action = OnDeleteAction.CASCADE)
    @JoinColumn(name = "productid", nullable = false)
    private Product productid;

}