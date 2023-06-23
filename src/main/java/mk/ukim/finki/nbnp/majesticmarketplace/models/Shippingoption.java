package mk.ukim.finki.nbnp.majesticmarketplace.models;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
@Table(name = "shippingoption")
public class Shippingoption {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "name", nullable = false, length = 20)
    private String name;

    @Column(name = "price", nullable = false)
    private Float price;

    @Column(name = "delivery_time", nullable = false)
    private Short deliveryTime;

}