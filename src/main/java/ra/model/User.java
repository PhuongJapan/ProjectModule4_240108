package ra.model;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import java.util.Date;

@Entity
@Table(name="Users")
@AllArgsConstructor
@NoArgsConstructor
@Data
@Builder
public class User {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "user_id")
    private int id;
    @Column(name = "user_name",columnDefinition = "varchar(50)",nullable = false,unique = true)
    private String userName;
    @Column(columnDefinition = "varchar(100)",nullable = false,unique = true)
    private String email;
    @Column(name = "password",columnDefinition = "varchar(50)",nullable = false)
    private String password;
    @DateTimeFormat(pattern = "yyyy-MM-dd")
    private Date created;
    //Mac dinh co quyen khach hang
    private boolean permission =false;
    @Column(name = "user_status")
    private boolean status = true;
}
