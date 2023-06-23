package mk.ukim.finki.nbnp.majesticmarketplace.models.views;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.Getter;
import lombok.Setter;
import org.hibernate.annotations.Immutable;

/**
 * Mapping for DB view
 */
@Getter
@Setter
@Entity
@Immutable
@Table(name = "review_user_product_view")
public class ReviewUserProductView {
    @Id
    @Column(name = "id")
    private Long id;

    @Column(name = "rating")
    private Short rating;

    @Column(name = "comment")
    private String comment;

    @Column(name = "username", length = 20)
    private String username;

    @Column(name = "productid")
    private Long productid;

    @Column(name = "name", length = 100)
    private String name;

}