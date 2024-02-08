package mk.ukim.finki.nbnp.majesticmarketplace.webControllers;

import lombok.AllArgsConstructor;
import mk.ukim.finki.nbnp.majesticmarketplace.models.views.ProductView;
import mk.ukim.finki.nbnp.majesticmarketplace.services.CategoryService;
import mk.ukim.finki.nbnp.majesticmarketplace.services.ProductService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;
import org.thymeleaf.util.StringUtils;

import java.util.List;

@Controller
@AllArgsConstructor
@RequestMapping
public class ProductController {

    private final ProductService productService;
    private final CategoryService categoryService;

    @GetMapping
    public String getProductPage(
            @RequestParam(defaultValue = "1") int pageNum,
            @RequestParam(defaultValue = "10") int results,
            @RequestParam(required = false) Long categoryId,
            @RequestParam(required = false) Integer from,
            @RequestParam(required = false) Integer to,
            @RequestParam(required = false) String word,
            Model model) {
        Page<ProductView> products;
        if (categoryId != null || from != null || to != null) {
            products = this.productService.findFiltered(categoryId, from, to, pageNum, results);

        } else if (!StringUtils.isEmpty(word)) {
            products = productService.searchProducts(word, pageNum, results);
        } else products = this.productService.findAllWithPagination(pageNum, results);
        model.addAttribute("page", products);
//        model.addAttribute("pageNum", pageNum);
//        model.addAttribute("results", results);
//        model.addAttribute("totalPages", calculateTotalPages(results));
        model.addAttribute("categories", categoryService.listAllCategories());
        model.addAttribute("categoryId", categoryId);
        model.addAttribute("from", from);
        model.addAttribute("to", to);
        return "products";
    }

    @GetMapping("/{id}")
    public String details(@PathVariable Long id, Model model) {
        model.addAttribute("products", productService.getDetails(id));
        return "products";
    }


    private int calculateTotalPages(int pageSize) {
        return (int) Math.ceil((double) productService.findAll().size() / pageSize);
    }

}