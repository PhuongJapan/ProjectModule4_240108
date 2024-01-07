package ra.service;

import org.springframework.web.multipart.MultipartFile;
import ra.model.Categories;
import ra.model.Product;
import ra.repository.ProductRepository;

import java.util.List;

public interface ProductService {
    List<Product> findAll();
    Product findById(String productId);
    boolean save(Product product, MultipartFile avatar,MultipartFile[] otherImages);
    boolean update(Product product);
    boolean delete(String productId);

}
