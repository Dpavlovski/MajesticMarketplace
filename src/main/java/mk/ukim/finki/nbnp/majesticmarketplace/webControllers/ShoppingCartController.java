package mk.ukim.finki.nbnp.majesticmarketplace.webControllers;

import lombok.AllArgsConstructor;
import mk.ukim.finki.nbnp.majesticmarketplace.models.views.ShoppingCartByUserView;
import mk.ukim.finki.nbnp.majesticmarketplace.services.ShoppingCartService;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

@RestController
@AllArgsConstructor
@RequestMapping("/api/shopping-cart")
public class ShoppingCartController {

    private final ShoppingCartService shoppingCartService;

    @GetMapping
    public ResponseEntity<?> getShoppingCart() {
        ShoppingCartByUserView shoppingCart = this.shoppingCartService.getShoppingCartRepository();
        return ResponseEntity.ok(shoppingCart);
    }

    @PostMapping("/add-product")
    public ResponseEntity<?> addProductToShoppingCart(@RequestParam Long productId,@RequestParam Short quantity) {
        this.shoppingCartService.add_shoppingCartItem(productId,quantity);
        return ResponseEntity.ok("Product added to shopping cart successfully.");
    }
}
