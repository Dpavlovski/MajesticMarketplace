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
@Table(name = "discountcode")
public class Discountcode {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "code", nullable = false, length = 5)
    private String code;

    @Column(name = "amount", nullable = false)
    private Integer amount;

    @Column(name = "is_active", nullable = false)
    private Boolean isActive = false;

    @Column(name = "admin_id", nullable = false)
    private Long adminId;

}