package ra.repository;

import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;
import org.springframework.stereotype.Repository;
import ra.model.Categories;

@Repository

public interface CategoriesRepository extends JpaRepository<Categories,Integer> {
    @Query("select c from Categories c where c.name like %?1%")
    Page<Categories> findByNameContainingIgnoreCase(String catalogName, Pageable pageable);

    int countByNameContains(String name);
    @Query("SELECT COUNT(pr.id) >= 1 FROM Product pr WHERE pr.catalog.id = :catalogId")
    boolean isCheckProductId(@Param("catalogId") int catalogId);
}
