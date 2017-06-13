package gr.excite.atm.controller;

import gr.excite.atm.model.Money;
import gr.excite.atm.service.MoneyService;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.servlet.http.HttpServletRequest;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

/**
 *
 * @author xrist
 */
@Controller
@RequestMapping("/transaction")
public class TransactionController {

    @Autowired
    MoneyService moneyService;

    /**
     * Serve the initialization jsp page
     *
     * @return
     */
    @RequestMapping("/initialization")
    public String initialization() {
        return "initialization";
    }

    /**
     * Serve the withdrawal jsp page
     *
     * @return
     */
    @RequestMapping("/withdrawal")
    public String withdrawal() {
        return "withdrawal";
    }

    @RequestMapping(path = "/initialize", method = RequestMethod.POST)
    public String initialize(HttpServletRequest request) {
        List<Money> money = new ArrayList<>();
        moneyService.deleteAll();
        money.add(new Money(20, Integer.parseInt(request.getParameter("amount20"))));
        money.add(new Money(50, Integer.parseInt(request.getParameter("amount50"))));
        moneyService.save(money);

        return "redirect:/";
    }

    /**
     * Withdraw a requested amount of money
     *
     * @param amount
     * @param request
     * @return
     */
    @RequestMapping(path = "/withdraw")
    public String withdrawal(HttpServletRequest request, Model model) {
        Map<Integer, Integer> requestedMoney = new HashMap<>();
        List<Money> availableMoney = moneyService.findAllByOrderByValueAsc();

        String amountReq = request.getParameter("amount");
        if (amountReq != null) {
            int amount = Integer.parseInt(amountReq);
            requestedMoney = moneyService.withdrawal(amount);
            if (requestedMoney == null || requestedMoney.isEmpty()) {
                model.addAttribute("error", "Your request could not be completed.");
            }
        }
        model.addAttribute("money", requestedMoney);
        model.addAttribute("availableMoney", availableMoney);
        return "withdrawal";
    }
}
