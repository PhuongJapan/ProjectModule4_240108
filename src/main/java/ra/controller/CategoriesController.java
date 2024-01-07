package ra.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import ra.model.Categories;
import ra.service.CategoriesService;

import javax.persistence.criteria.CriteriaBuilder;
import java.util.List;
import java.util.Optional;

@Controller
@RequestMapping("/categoriesController")

public class CategoriesController {
    @Autowired
    private CategoriesService categoriesService;
    @Autowired
    private static final int SIZE = 100;
    @Autowired
    private static String catalogNameDefault = "";
    @Autowired
    private static String directionDefault = "ASC";
    @Autowired
    private static String sortByDefault = "catalogId";
    @Autowired
    private static int pageDefault = 1;

    @GetMapping("/findAll")
    public ModelAndView findAll(){
        ModelAndView mav= new ModelAndView("admin/categories");
        List<Categories> listCategories = categoriesService.findAll();
        mav.addObject("listCategories",listCategories);
        return mav;
    }

    @PostMapping("/create")
    public String createCategories(Categories cateNew){
        boolean result= categoriesService.save(cateNew);
        if(result){
            return "redirect:findAll";
        }else {
            return "admin/error";
        }
    }

    @GetMapping("/findCategories")
    public ModelAndView displayCategories(@RequestParam(defaultValue = "") Optional<Integer> page,
                                          @RequestParam(defaultValue = "") Optional<String> direction,
                                          @RequestParam(defaultValue = "") Optional<String> sortBy,
                                          @RequestParam(defaultValue = "") Optional<String> name){
        int totalPage;
        ModelAndView mav = new ModelAndView("admin/categories");
        catalogNameDefault = name.orElse(catalogNameDefault);
        directionDefault=direction.orElse(directionDefault);
        sortByDefault=sortBy.orElse(sortByDefault);
        pageDefault=page.orElse(pageDefault);
        List<Categories> listCategories = categoriesService.displayData(pageDefault-1,SIZE,
                directionDefault,sortByDefault,catalogNameDefault);
        totalPage = (int) Math.ceil((double) categoriesService.getListPage(catalogNameDefault
        ) / SIZE);
        mav.addObject("listCategories",listCategories);
        mav.addObject("totalPage",totalPage);
        mav.addObject("catalogName",catalogNameDefault);
        mav.addObject("sortBy",sortByDefault);
        mav.addObject("direction",directionDefault);
        return mav;
    }

    @GetMapping("/initUpdate")
    public ModelAndView initUpdate(int catalogId){
        Categories updateCategories = categoriesService.findById(catalogId);
        ModelAndView mav = new ModelAndView("admin/categoriesUpdate");
        mav.addObject("updateCategories",updateCategories);
        return mav;
    }
    @PostMapping("/update")
    public String updateCategories(@ModelAttribute Categories cateUpdate){
        boolean result= categoriesService.update(cateUpdate);
        if(result){
            return "redirect:findAll";
        }else {
            return "admin/error";
        }
    }
    @GetMapping("/delete")
    public String deleteCategories(int catalogId){
        boolean result = categoriesService.delete(catalogId);
        if (result){
            return "redirect: findAll";
        }else {
            return "admin/error";
        }
    }
}
