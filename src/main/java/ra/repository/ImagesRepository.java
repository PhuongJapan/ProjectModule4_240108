package ra.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;
import ra.model.Images;

@Repository
public interface ImagesRepository extends JpaRepository<Images,Integer> {
}
