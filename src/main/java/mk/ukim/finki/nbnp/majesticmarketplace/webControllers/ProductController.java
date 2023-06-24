package mk.ukim.finki.nbnp.majesticmarketplace.webControllers;

import lombok.AllArgsConstructor;
import mk.ukim.finki.nbnp.majesticmarketplace.models.views.ProductView;
import mk.ukim.finki.nbnp.majesticmarketplace.services.ProductService;
import org.springframework.web.bind.annotation.*;

import java.time.Instant;
import java.util.List;

@RestController
@RequestMapping("/api/products")
@AllArgsConstructor
public class ProductController {
    private final ProductService productService;
    @GetMapping()
    public List<ProductView> productList(){
        return productService.productViewList();
    }

    @GetMapping("/{id}")
    public ProductView details(@PathVariable Long id){
        return productService.getDetails(id);
    }


    @PutMapping("/edit")
    public void edit(@RequestParam Long id, @RequestParam String name,@RequestParam String description,@RequestParam String image, @RequestParam Long categoryId){
       productService.editProduct(id,name,description,image,categoryId);
    }


    @PostMapping("/add")
    public void save(@RequestParam String name, @RequestParam String description, @RequestParam String image, @RequestParam Long categoryId, @RequestParam Float price, @RequestParam Instant validFrom, @RequestParam Instant validTill){
        productService.addProduct(name,description,image,categoryId,price,validFrom,validTill);
    }

    @DeleteMapping("/delete/{id}")
    public void delete(@PathVariable Long id){
        productService.deleteProduct(id);
    }
}
