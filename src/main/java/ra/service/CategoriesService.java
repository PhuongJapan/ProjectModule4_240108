package ra.service;

import ra.model.Categories;

import java.util.List;

public interface CategoriesService {
    List<Categories> findAll();
    boolean save(Categories categories);
    Categories findById(int categoryId);

    boolean update(Categories categories);
    List<Categories> displayData(int page, int size, String direction, String sortBy,String catalogName);
    int getListPage(String catalogName);

    boolean delete(int categoryId);
}
