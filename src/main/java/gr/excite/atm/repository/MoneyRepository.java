package gr.excite.atm.repository;

import gr.excite.atm.model.Money;
import java.util.List;
import org.springframework.data.jpa.repository.JpaRepository;

/**
 *
 * @author xrist
 */
public interface MoneyRepository extends JpaRepository<Money, Long>  {
    
    public List<Money> findAllByOrderByValueAsc();
}
