package mk.ukim.finki.nbnp.majesticmarketplace.repositories;

import mk.ukim.finki.nbnp.majesticmarketplace.models.views.ProductView;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.jpa.repository.query.Procedure;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;

import java.time.Instant;
import java.util.List;

@Repository
public interface ProductsViewRepository extends JpaRepository<ProductView,Long> {
    @Query(value = "SELECT * FROM show_products()",nativeQuery = true)
    List<ProductView> findAllProducts();

    @Query(value = "SELECT * FROM details_product(:productId)",nativeQuery = true)
    ProductView details(@Param("productId") Long productId);

//    @Query(value = "SELECT * FROM edit_product(:productId,:name,:description,:image,:categoryId)",nativeQuery = true)
//    void edit(@Param("productId") Long productId, @Param("name") String name, @Param("description") String description, @Param("image") String image, @Param("categoryId") Long categoryId);
//
//    @Query(value = "SELECT * FROM add_product(:name,:description.:image,:categoryId,:price,:validForm,:validTill)",nativeQuery = true)
//    void create(@Param("name") String name, @Param("description") String description, @Param("image") String image, @Param("categoryId") Long categoryId, @Param("price") Float price, @Param("validFrom") Instant validFrom, @Param("validTill") Instant validTill);
//    @Query(value = "SELECT * FROM delete_product(:productId)",nativeQuery = true)
//    void delete(Long productId);

    @Query(value = "SELECT * FROM products_in_category(:categoryId)",nativeQuery = true)
    List<ProductView> findAllInCategory(@Param("categoryId") Long categoryId);
    @Query(value = "SELECT * FROM products_in_price_range(:from,:to)",nativeQuery = true)
    List<ProductView> findAllInPriceRange(@Param("from") int from,@Param("to") int to);


}
