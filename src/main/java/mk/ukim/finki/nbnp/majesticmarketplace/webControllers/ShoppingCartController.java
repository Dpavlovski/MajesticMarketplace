//package mk.ukim.finki.nbnp.majesticmarketplace.webControllers;
//
//import lombok.AllArgsConstructor;
//import mk.ukim.finki.nbnp.majesticmarketplace.models.views.ShoppingCartByUserView;
//import mk.ukim.finki.nbnp.majesticmarketplace.services.ShoppingCartService;
//import org.springframework.http.ResponseEntity;
//import org.springframework.web.bind.annotation.*;
//
//import java.util.List;
//
//@RestController
//@AllArgsConstructor
//@RequestMapping("/api/shopping-cart")
//public class ShoppingCartController {
//
//    private final ShoppingCartService shoppingCartService;
//
//    @GetMapping
//    public ResponseEntity<?> listShoppingCartItems() {
//        List<ShoppingCartByUserView> shoppingCart = this.shoppingCartService.findShoppingCartByUser();
//        return ResponseEntity.ok(shoppingCart);
//    }
//
//    @PostMapping("/add-product")
//    public ResponseEntity<?> addProductToShoppingCart(@RequestParam Long productId,@RequestParam Short quantity) {
//        this.shoppingCartService.add_shoppingCartItem(productId,quantity);
//        return ResponseEntity.ok("Product added to shopping cart successfully.");
//    }
//}
//



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
        List<ShoppingCartByUserView> shoppingCartItems = this.shoppingCartService.findShoppingCartByUser();
        model.addAttribute("items", shoppingCartItems.stream().distinct().collect(Collectors.toList()));
        model.addAttribute("bodyContent", "shopping-cart");
        return "master-template";
    }

    @PostMapping("/add-product")
    public String addProductToShoppingCart(@RequestParam Long id,@RequestParam Short quantity) {
        this.shoppingCartService.add_shoppingCartItem(id,quantity);
        return "redirect:/shopping-cart";
    }
}

