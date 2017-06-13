package gr.excite.atm.service;

import gr.excite.atm.model.Money;
import gr.excite.atm.repository.MoneyRepository;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import javax.annotation.Resource;
import org.springframework.stereotype.Service;

/**
 * Business logic related to Money class
 *
 * @author xrist
 */
@Service
public class MoneyService {

    @Resource
    MoneyRepository moneyRepository;

    /**
     * Get a list of money entities
     *
     * @return
     */
    public List<Money> findAll() {
        return moneyRepository.findAll();
    }

    /**
     * Get a list of money ordered by value
     *
     * @return
     */
    public List<Money> findAllByOrderByValueAsc() {
        return moneyRepository.findAllByOrderByValueAsc();
    }

    /**
     * Save a Money entity
     *
     * @param money
     * @return
     */
    public Money save(Money money) {
        return moneyRepository.save(money);
    }

    /**
     * Save a list of Money entities
     *
     * @param money
     * @return
     */
    public List<Money> save(List<Money> money) {
        for (Money m : money) {
            m = moneyRepository.save(m);
        }
        return money;
    }

    public void deleteAll() {
        moneyRepository.deleteAll();
    }

    /**
     * Check is there is any money in the ATM machine
     *
     * @return
     */
    public boolean isInitialized() {
        return !moneyRepository.findAll().isEmpty();
    }

    /**
     * Withdraw an amount of money. Check if the requested amount can be
     * delivered, reduce the amount in the db, and return a list of money
     * entities.
     *
     * @param amount
     * @return
     */
    public Map<Integer, Integer> withdrawal(int amount) {
        List<Money> availableMoney = moneyRepository.findAllByOrderByValueAsc();
        Map<Integer, Integer> requestedMoney = new HashMap<>();
        boolean isValid = false;
        int div20 = amount / 20;
        int div50 = amount / 50;

        if (div50 != 0 && amount % 50 == 0) {
            requestedMoney.put(50, div50);
        } else if (div20 != 0 && amount % 20 == 0) {
            requestedMoney.put(20, div20);
        } else if ((amount - div50 * 50) / 20 != 0 && (amount - div50 * 50) % 20 == 0) {
            requestedMoney.put(50, div50);
            requestedMoney.put(20, (amount - div50 * 50) / 20);
        } else if ((amount - div20 * 20) / 50 != 0 && (amount - div20 * 20) % 50 == 0) {
            requestedMoney.put(20, div20);
            requestedMoney.put(50, (amount - div20 * 20) / 50);
        }

        for (Money money : availableMoney) {
            if (money.getValue() == 20 && requestedMoney.containsKey(20)) {
                if (requestedMoney.get(20) <= money.getAmount()) {
                    money.setAmount(money.getAmount() - requestedMoney.get(20));
                    save(money);
                    isValid = true;
                }
            } else if (money.getValue() == 50 && requestedMoney.containsKey(50)) {
                if (requestedMoney.get(50) <= money.getAmount()) {
                    money.setAmount(money.getAmount() - requestedMoney.get(50));
                    save(money);
                    isValid = true;
                }
            }
        }

        return isValid ? requestedMoney : null;
    }
}
