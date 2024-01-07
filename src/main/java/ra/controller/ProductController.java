package ra.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import ra.model.Categories;
import ra.model.Product;
import ra.service.CategoriesService;
import ra.service.ProductService;

import java.util.List;

@Controller
@RequestMapping("/productController")

public class ProductController {
    @Autowired
    private ProductService productService;
    @Autowired
    private CategoriesService categoriesService;
    @GetMapping("/findAll")
    public ModelAndView findAll(){
        ModelAndView mav= new ModelAndView("admin/productManagement");
        List<Product> listProducts = productService.findAll();

        mav.addObject("listProducts",listProducts);
        return mav;
    }
    @GetMapping("/initCreate")
    public ModelAndView initCreate(){
        List<Categories> listCategoriesCreate = categoriesService.findAll();
        ModelAndView mav = new ModelAndView("admin/newProduct");
        mav.addObject("listCategoriesCreate",listCategoriesCreate);
        //tên attributeName và jsp phải giống nhau
        return mav;
    }
    @PostMapping("/create")
    public String createProduct(Product productNew, MultipartFile avatar, MultipartFile[] otherImages){
        boolean result = productService.save(productNew,avatar,otherImages);
        if (result){
            return "redirect:findAll";
        }else{
            return "admin/error";
        }

    }
    @GetMapping("/initUpdate")
    public ModelAndView initUpdate(String productId){
        Product updateProduct = productService.findById(productId);
        ModelAndView mav = new ModelAndView("admin/productUpdate");
        mav.addObject("updateProduct",updateProduct);
        return mav;
    }
    @PostMapping("/update")
    public String updateProduct(Product proUpdate,MultipartFile avatar, MultipartFile[] otherImages){
        boolean result= productService.update(proUpdate);
        if(result){
            return "redirect:findAll";
        }else {
            return "admin/error";
        }
    }
    @GetMapping("/delete")
    public String deleteProduct(String productId){
        boolean result = productService.delete(productId);
        if (result){
            return "redirect: findAll";
        }else {
            return "admin/error";
        }
    }
}
