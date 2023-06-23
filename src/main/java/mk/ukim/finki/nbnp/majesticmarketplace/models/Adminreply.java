package mk.ukim.finki.nbnp.majesticmarketplace.models;

import jakarta.persistence.*;
import lombok.Getter;
import lombok.Setter;

import java.time.Instant;

@Getter
@Setter
@Entity
@Table(name = "adminreply")
public class Adminreply {
    @Id
    @Column(name = "id", nullable = false)
    private Long id;

    @ManyToOne(fetch = FetchType.LAZY, optional = false)
    @JoinColumn(name = "review_id", nullable = false)
    private Review review;

    @Column(name = "comment", nullable = false)
    private String comment;

    @Column(name = "created_timestamp", nullable = false)
    private Instant createdTimestamp;

}