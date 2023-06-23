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
@Table(name = "order_status")
public class OrderStatus {
    @Id
    @Column(name = "id", nullable = false)
    private Integer id;

    @Column(name = "status_type", nullable = false)
    private String statusType;

}