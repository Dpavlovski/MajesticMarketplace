package mk.ukim.finki.nbnp.majesticmarketplace.services;

import lombok.AllArgsConstructor;
import mk.ukim.finki.nbnp.majesticmarketplace.models.views.OrderUserView;
import mk.ukim.finki.nbnp.majesticmarketplace.repositories.OrderRepository;
import mk.ukim.finki.nbnp.majesticmarketplace.repositories.OrderViewRepository;
import org.springframework.stereotype.Service;
import java.util.List;

@Service
@AllArgsConstructor
public class OrderService{

    private final OrderRepository orderRepository;
    private final OrderViewRepository orderViewRepository;

    public List<OrderUserView> orderByUser(){
        return orderViewRepository.getOrderByUser();
    }
    public boolean create_order(){
        return orderRepository.createOrder();
    }
}
