package ra.serviceImp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import ra.model.Images;
import ra.model.Product;
import ra.repository.CategoriesRepository;
import ra.repository.ImagesRepository;
import ra.repository.ProductRepository;
import ra.service.ProductService;
import ra.service.UploadFileService;

import java.util.List;

@Service
public class ProductServiceImp implements ProductService {
    @Autowired
    private ProductRepository productRepository;
    @Autowired
    private CategoriesRepository categoriesRepository;
    @Autowired
    private UploadFileService uploadFileService;
    @Autowired
    private ImagesRepository imagesRepository;
    @Override
    public List<Product> findAll() {
        return productRepository.findAll();
    }

    @Override
    public Product findById(String productId) {
        return productRepository.findById(productId).get();
    }

    @Override
    public boolean save(Product product, MultipartFile avatar, MultipartFile[] otherImages) {
        //1.upload avartar và otherImages lên firebase và lấy lại đường link
        //Upload ảnh avatar
        String avatar_link = uploadFileService.uploadFile(avatar);
        //2. Set link vào product
        product.setAvatarImage(avatar_link);
        //3.Thêm mới sản phẩm
        Product proNew = productRepository.save(product);
        //Thêm mới các ảnh phụ vào Images
        for(MultipartFile file: otherImages){
            String link = uploadFileService.uploadFile(file);
            Images images= new Images();
            images.setImageLink(link);
            images.setProduct(proNew);
            imagesRepository.save(images);
        }
        return proNew!=null?true:false;
    }

    @Override
    public boolean update(Product product) {
        //Lấy product
        Product proUpdate = productRepository.findById(product.getId()).get();
        proUpdate.setName(product.getName());
        proUpdate.setPrice(product.getPrice());
        proUpdate.setQuantity(product.getQuantity());
        proUpdate.setDescription(product.getDescription());
        proUpdate.setAvatarImage(product.getAvatarImage());
        proUpdate.setListImages(product.getListImages());
        proUpdate.setCatalog();
        proUpdate.setStatus(product.isStatus());
        Product pro = productRepository.save(proUpdate);
        return  pro!=null?true:false;
    }

    @Override
    public boolean delete(String productId) {
        boolean result = false;
        try{
            productRepository.deleteById(productId);
            result = true;
        }catch (Exception ex){
            ex.printStackTrace();
        }
        return result;
    }
}
