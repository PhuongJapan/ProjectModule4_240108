package ra.model;

import javax.persistence.*;

@Entity
@Table(name="BillDetail")

public class BillDetail {
    @Id
    @Column(name="bill_detail_id")
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
    @Column(name="buy_price")
    private float buyPrice;
    private int quantity;

}
