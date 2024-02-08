package mk.ukim.finki.nbnp.majesticmarketplace.services;

import lombok.AllArgsConstructor;
import mk.ukim.finki.nbnp.majesticmarketplace.models.views.ProductView;
import mk.ukim.finki.nbnp.majesticmarketplace.repositories.ProductsViewRepository;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.PageRequest;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ProductService {
    private final ProductsViewRepository productsRepository;

    public Page<ProductView> findAllWithPagination(int pageNum, int pageSize) {
        return productsRepository.findAllWithPagination(PageRequest.of(pageNum, pageSize));
    }

    public List<ProductView> findAll() {
        return productsRepository.findAll();
    }

    public Page<ProductView> findFiltered(Long categoryId, Integer from, Integer to, Integer pageNum, Integer results) {
        return productsRepository.findFiltered(categoryId, from, to, PageRequest.of(pageNum - 1, results));
    }

    public ProductView getDetails(Long id) {
        return productsRepository.details(id);
    }


    public List<ProductView> filterByCategory(Long categoryId) {
        return productsRepository.findAllInCategory(categoryId);
    }

    public List<ProductView> filterByPriceRange(int from, int to) {
        return productsRepository.findAllInPriceRange(from, to);
    }
    public Page<ProductView> searchProducts(String word, int pageNum, int results) {
        return productsRepository.searchProducts(word, PageRequest.of(pageNum, results));
    }

}
