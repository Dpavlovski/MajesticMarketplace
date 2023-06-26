package mk.ukim.finki.nbnp.majesticmarketplace.services;

import lombok.AllArgsConstructor;
import mk.ukim.finki.nbnp.majesticmarketplace.models.views.ShoppingCartByUserView;
import mk.ukim.finki.nbnp.majesticmarketplace.repositories.ShoppingCartRepository;
import org.springframework.stereotype.Service;

import java.util.List;

@Service
@AllArgsConstructor
public class ShoppingCartService {
    private final ShoppingCartRepository shoppingCartRepository;

    public List<ShoppingCartByUserView> findShoppingCartByUser() {
        return shoppingCartRepository.getShoppingCartByUser();
    }

    public void add_shoppingCartItem(Long productId,Short quantity) {
        shoppingCartRepository.addShoppingCartItem(productId,quantity);
    }
}





