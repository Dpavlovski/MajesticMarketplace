package mk.ukim.finki.nbnp.majesticmarketplace.webControllers;


import lombok.AllArgsConstructor;
import mk.ukim.finki.nbnp.majesticmarketplace.models.views.ShoppingCartByUserView;
import mk.ukim.finki.nbnp.majesticmarketplace.services.ShoppingCartService;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;
import java.util.stream.Collectors;

@Controller
@AllArgsConstructor
@RequestMapping("/shopping-cart")
public class ShoppingCartController {

    private final ShoppingCartService shoppingCartService;

    @GetMapping
    public String getShoppingCartPage(Model model) {
        List<ShoppingCartByUserView> shoppingCartItems = shoppingCartService.findShoppingCartByUser();
        model.addAttribute("items", shoppingCartItems);
        return "shopping-cart";
    }

    @PostMapping("/add-product/{id}")
    public String addProductToShoppingCart(@PathVariable Long id, @RequestParam Short quantity) {
        shoppingCartService.add_shoppingCartItem(id, quantity);
        return "redirect:/";
    }

    @PostMapping("/delete-product")
    public String deleteProductFromShoppingCart(@RequestParam Long productId) {
        shoppingCartService.delete_shoppingCartItem(productId);
        return "redirect:/shopping-cart";
    }

}

