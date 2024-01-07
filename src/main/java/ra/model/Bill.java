package ra.model;

import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="Bill")

public class Bill {
    @Id
    @Column(name="bill_id",columnDefinition = "char(5)")
    private String billId;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date created;
    @Column(name="bill_status")
    private boolean status;
    @ManyToOne
    @JoinColumn(name="user_id",referencedColumnName = "user_id")
    private User user;

}
