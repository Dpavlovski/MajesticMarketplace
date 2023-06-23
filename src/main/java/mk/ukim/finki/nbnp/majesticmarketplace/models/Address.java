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
@Table(name = "address")
public class Address {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @Column(name = "street", nullable = false, length = 30)
    private String street;

    @Column(name = "street_number", nullable = false)
    private Integer streetNumber;

    @Column(name = "entry_number")
    private Integer entryNumber;

    @Column(name = "floor")
    private Integer floor;

}