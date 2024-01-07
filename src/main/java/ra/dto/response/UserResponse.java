package ra.dto.response;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import ra.model.User;

import java.util.Date;
@AllArgsConstructor
@NoArgsConstructor
@Data
public class UserResponse extends User {
    private int userId;
    private String userName;
    private String password;
    private String email;
    private Date created;
    private boolean status;
}