package mk.ukim.finki.nbnp.majesticmarketplace.webControllers;

import com.stripe.Stripe;
import com.stripe.exception.StripeException;
import com.stripe.model.Charge;
import com.stripe.model.Customer;
import com.stripe.param.ChargeCreateParams;
import com.stripe.param.CustomerCreateParams;
import lombok.RequiredArgsConstructor;
import mk.ukim.finki.nbnp.majesticmarketplace.models.views.OrderUserView;
import mk.ukim.finki.nbnp.majesticmarketplace.services.OrderService;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import java.util.List;

@Controller
@RequestMapping("/order")
@RequiredArgsConstructor
public class OrderController {

    private final OrderService orderService;

    @Value("${stripe.publicKey}")
    private String stripePublicKey;
    @Value("${stripe.secretKey}")
    private String stripeSecretKey;

    @GetMapping
    public String getOrderByUserPage(Model model) {
        List<OrderUserView> orderItems = orderService.orderByUser();
        model.addAttribute("orderItems", orderItems);
        model.addAttribute("publicKey", stripePublicKey);
        return "order";
    }

    @PostMapping("/create")
    public String createOrder() {
        boolean orderItems = orderService.create_order();
        if (orderItems) {
            return "redirect:/order";
        }
        return "shopping-cart";
    }
    @PostMapping("/pay")
    public String pay(
            @RequestParam("stripeEmail") String stripeEmail,
            @RequestParam("stripeToken") String stripeToken,
            @RequestParam("amount") Double amount) throws StripeException {

        // Initialize the Stripe secret key
        Stripe.apiKey = stripeSecretKey;

        // Convert the amount from dollars to cents
        long amountInCents = amount.longValue();

        // Create a customer
        CustomerCreateParams customerCreateParams = new CustomerCreateParams.Builder()
                .setEmail(stripeEmail)
                .setSource(stripeToken)
                .build();
        Customer customer = Customer.create(customerCreateParams);

        // Create a charge
        ChargeCreateParams chargeCreateParams = ChargeCreateParams.builder()
                .setAmount(amountInCents)
                .setDescription("Order payment")
                .setCurrency("usd")
                .setCustomer(customer.getId())
                .build();
        Charge charge = Charge.create(chargeCreateParams);

        // Process the appointment if the charge is successful
        if ("succeeded".equals(charge.getStatus())) {
            return "redirect:/order/successPayment";
        }
        // Redirect or respond as needed
        return "redirect:/order";
    }

    @GetMapping("/successPayment")
    public String getSuccessPayment(Model model) {
        List<OrderUserView> orderItems = orderService.orderByUser();
        model.addAttribute("orderItems", orderItems);
        model.addAttribute("publicKey", stripePublicKey);
        return "successPayment";
    }
}

