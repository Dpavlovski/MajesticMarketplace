package mk.ukim.finki.nbnp.majesticmarketplace.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;

@Getter
@Setter
@Entity
@Table(name = "payment")
public class Payment {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "order_id", nullable = false)
    private Order order;

    @Column(name = "card_number", nullable = false, length = 25)
    private String cardNumber;

    @Column(name = "expiration_year", nullable = false)
    private Short expirationYear;

    @Column(name = "expiration_month", nullable = false)
    private Short expirationMonth;

    @Column(name = "security_code", nullable = false)
    private Integer securityCode;

    @Column(name = "created_timestamp", nullable = false)
    private Instant createdTimestamp;

    @Column(name = "cardholder_firstname", nullable = false, length = 40)
    private String cardholderFirstname;

    @Column(name = "cardholder_lastname", nullable = false, length = 40)
    private String cardholderLastname;

}