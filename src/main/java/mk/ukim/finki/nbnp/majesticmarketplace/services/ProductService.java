package mk.ukim.finki.nbnp.majesticmarketplace.services;

import lombok.AllArgsConstructor;
import mk.ukim.finki.nbnp.majesticmarketplace.models.views.ProductView;
import mk.ukim.finki.nbnp.majesticmarketplace.repositories.ProductsViewRepository;
import org.springframework.stereotype.Service;

import java.time.Instant;
import java.util.List;

@Service
@AllArgsConstructor
public class ProductService {
    private final ProductsViewRepository productsRepository;

    public List<ProductView> findAll(){
        return productsRepository.findAllProducts();
    }

    public  ProductView getDetails(Long id){
        return productsRepository.details(id);
    }


    public List<ProductView> filterByCategory(Long categoryId){
        return productsRepository.findAllInCategory(categoryId);
    }

    public List<ProductView> filterByPriceRange(int from,int to){
        return productsRepository.findAllInPriceRange(from,to);
    }

}
