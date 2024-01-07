package ra.serviceImp;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Pageable;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Service;
import ra.model.Categories;
import ra.repository.CategoriesRepository;
import ra.service.CategoriesService;

import java.util.ArrayList;
import java.util.List;

@Service
public class CategoriesServiceImp implements CategoriesService {
    @Autowired
    private CategoriesRepository categoriesRepository;

    @Override
    public List<Categories> findAll() {
        return categoriesRepository.findAll();
    }

    @Override
    public boolean save(Categories categories) {
        Categories cateNew = categoriesRepository.save(categories);
        return cateNew != null ? true : false;
    }

    @Override
    public Categories findById(int categoryId) {
//        Optional<Categories> cateUpdate = categoriesRepository.findById(categoryId);
        return categoriesRepository.findById(categoryId).get();
    }

    @Override
    public boolean update(Categories categories) {
        Categories cateUpdate = categoriesRepository.findById(categories.getId()).get();
        cateUpdate.setName(categories.getName());
        cateUpdate.setDescriptions(categories.getDescriptions());
        cateUpdate.setStatus(categories.isStatus());
        Categories cate = categoriesRepository.save(cateUpdate);
        return cate != null ? true : false;
    }

    @Override
    public int getListPage(String catalogName) {
        int countCate = categoriesRepository.countByNameContains(catalogName);
        return countCate;
    }

    @Override
    public List<Categories> displayData(int page, int size, String direction, String sortBy, String catalogName) {
        Pageable pageable = PageRequest.of(page, size,
                direction.equals("ASC") ? Sort.Direction.ASC : Sort.Direction.DESC, sortBy);
        List<Categories> listCategories = categoriesRepository.findByNameContainingIgnoreCase(catalogName, pageable).getContent();
        return listCategories;
    }


    @Override
    public boolean delete(int categoryId) {
        boolean result = false;
        try {
            boolean isCheck = categoriesRepository.isCheckProductId(categoryId);
            if (!isCheck) {
                categoriesRepository.deleteById(categoryId);
                result = true;
            } else {
                return false;
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
        return result;
    }
}
