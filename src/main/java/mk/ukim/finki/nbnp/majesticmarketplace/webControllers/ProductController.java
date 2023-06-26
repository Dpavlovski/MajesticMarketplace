//package mk.ukim.finki.nbnp.majesticmarketplace.webControllers;
//
//import lombok.AllArgsConstructor;
//import mk.ukim.finki.nbnp.majesticmarketplace.models.views.ProductView;
//import mk.ukim.finki.nbnp.majesticmarketplace.services.ProductService;
//import org.springframework.web.bind.annotation.*;
//
//import java.time.Instant;
//import java.util.List;
//
//@RestController
//@RequestMapping("/api/products")
//@AllArgsConstructor
//public class ProductController {
//    private final ProductService productService;
//    @GetMapping()
//    public List<ProductView> productList(){
//        return productService.findAll();
//    }
//
//    @GetMapping("/{id}")
//    public ProductView details(@PathVariable Long id){
//        return productService.getDetails(id);
//    }
//
//
//    @PutMapping("/edit")
//    public void edit(@RequestParam Long id, @RequestParam String name,@RequestParam String description,@RequestParam String image, @RequestParam Long categoryId){
//       productService.editProduct(id,name,description,image,categoryId);
//    }
//
//
//    @PostMapping("/add")
//    public void save(@RequestParam String name, @RequestParam String description, @RequestParam String image, @RequestParam Long categoryId, @RequestParam Float price, @RequestParam Instant validFrom, @RequestParam Instant validTill){
//        productService.addProduct(name,description,image,categoryId,price,validFrom,validTill);
//    }
//
//    @DeleteMapping("/delete/{id}")
//    public void delete(@PathVariable Long id){
//        productService.deleteProduct(id);
//    }
//}



package mk.ukim.finki.nbnp.majesticmarketplace.webControllers;

import lombok.AllArgsConstructor;
import mk.ukim.finki.nbnp.majesticmarketplace.models.views.ProductView;
import mk.ukim.finki.nbnp.majesticmarketplace.services.CategoryService;
import mk.ukim.finki.nbnp.majesticmarketplace.services.ProductService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping("/products")
public class ProductController {

    private final ProductService productService;
    private final CategoryService categoryService;

    @GetMapping
    public String getProductPage(
           @RequestParam (required = false) Long categoryId, @RequestParam (required = false) Integer from, @RequestParam (required = false) Integer to,
            Model model) {
        List<ProductView> productsList;
        if(categoryId!=null)
            productsList = this.productService.filterByCategory(categoryId);
        else if(from != null && to != null)
           productsList = this.productService.filterByPriceRange(from,to);
        else productsList = this.productService.findAll();
        model.addAttribute("products", productsList);
        model.addAttribute("categories",categoryService.listAllCategories());
        model.addAttribute("bodyContent", "products");
        return "master-template";
    }

    @GetMapping("/{id}")
    public String details(@PathVariable Long id,Model model){
        model.addAttribute("products", productService.getDetails(id));
        model.addAttribute("bodyContent", "products");
        return "master-template";
    }


}