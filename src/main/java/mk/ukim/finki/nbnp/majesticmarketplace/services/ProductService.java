package mk.ukim.finki.nbnp.majesticmarketplace.services;

import lombok.AllArgsConstructor;
import mk.ukim.finki.nbnp.majesticmarketplace.models.Product;
import mk.ukim.finki.nbnp.majesticmarketplace.models.views.ProductView;
import mk.ukim.finki.nbnp.majesticmarketplace.repositories.ProductsRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@AllArgsConstructor
public class ProductService {
    private final ProductsRepository productsRepository;

    public List<ProductView> findAll(){
        return productsRepository.findAllProducts();
    }

    public Product getDetails(Long id){
        return productsRepository.details(id);
    }

    public void addProduct(String name,String description,String image,Long categoryId){
        productsRepository.create(name,description,image,categoryId);
    }

    public void editProduct(Long id,String name,String description,String image,Long categoryId){
        productsRepository.edit(id,name,description,image,categoryId);
    }
    public void deleteProduct(Long id){
        productsRepository.delete(id);
    }

    public List<Product> filterByCategory(Long categoryId){
        return productsRepository.findAllInCategory(categoryId);
    }

    public List<Product> filterByPriceRange(int from,int to){
        return productsRepository.findAllInPriceRange(from,to);
    }
}
