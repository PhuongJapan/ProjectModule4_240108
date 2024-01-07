package ra.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import ra.dto.request.LoginRequest;
import ra.dto.response.LoginResponse;
import ra.dto.response.UserResponse;
import ra.model.Categories;
import ra.model.Product;
import ra.model.User;
import ra.service.CategoriesService;
import ra.service.ProductService;
import ra.service.UserService;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.util.List;

@Controller
@RequestMapping("/userController")

public class UserController {
    @Autowired
    private UserService userService;
    @Autowired
    private CategoriesService categoriesService;
    @Autowired
    private ProductService productService;

    @GetMapping("/findAll")
    public ModelAndView getAllUser() {
        ModelAndView mav = new ModelAndView("admin/userManagement");
        List<UserResponse> listUser = userService.findAll();
        mav.addObject("listUser", listUser);
        return mav;
    }
    @GetMapping("/wellcome")
    public String wellcomeUser(ModelMap modelMap, HttpServletRequest request){
        //Lấy thông tin từ Cookie
        Cookie[] cookies = request.getCookies();
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals("userName")){
                modelMap.addAttribute("userName",cookie.getValue());
                break;
            }
        }
        return "user/userPage";
    }
    @GetMapping("/getData")
    public ModelAndView getAllData() {
        ModelAndView mav = new ModelAndView("admin/dashboard");
        List<UserResponse> listUser = userService.findAll();
        int active = 0;
        int inactive= 0;
        for(User user :listUser){
            if(user.isStatus()==true){
                active +=1;
            }else {
                inactive +=1;
            }
        }
        mav.addObject("userActive",active);
        mav.addObject("userInactive",inactive);
        List<Product> listProduct = productService.findAll();
        mav.addObject("listProductNumber",listProduct.size());
        return mav;
    }

    @PostMapping("/login")
    public String login(LoginRequest loginRequest, ModelMap modelMap, HttpServletResponse response, HttpServletRequest request) {
        //Gọi sang service để login
        LoginResponse loginResponse = userService.login(loginRequest);
        if (loginResponse == null) {
            //Đăng nhập thất bại --> login
            modelMap.addAttribute("error", "Email or password incorrect");
            return "login";
        }
        //Đăng nhập thành công
        //1.Lưu thông tin user vào cookie
        Cookie cookieUserId = new Cookie("userId", loginResponse.getId() + "");
        Cookie cookieUserName = new Cookie("email", loginResponse.getEmail());
        Cookie cookiePermission = new Cookie("permission", String.valueOf(loginResponse.isPermission()));
        response.addCookie(cookieUserId);
        response.addCookie(cookieUserName);
        response.addCookie(cookiePermission);
        //2. Kiểm tra quyền và điều hướng về trang admin hoặc user
        if (loginResponse.isPermission()) {
            //Trang admin
//            return "redirect:findAll";
            return "redirect:getData";
        }
        //Trang user
        return "redirect:wellcome";

    }




}
