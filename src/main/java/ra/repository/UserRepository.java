package ra.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import ra.model.User;

import java.util.Optional;

public interface UserRepository extends JpaRepository<User,Long> {
    Optional<User> findByEmailAndPassword(String email, String password);
        int countUsersByStatusIsTrue();
    int countUsersByStatusIsFalse();

}
