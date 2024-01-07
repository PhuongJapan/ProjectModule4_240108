package ra.serviceImp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import ra.model.Images;
import ra.repository.ImagesRepository;
import ra.service.ImagesService;
@Service
public class ImagesServiceImp implements ImagesService {
    @Autowired
    private ImagesRepository imagesRepository;
    @Override
    public boolean save(Images images) {
        Images image = imagesRepository.save(images);
        return image!=null?true:false;
    }
}
