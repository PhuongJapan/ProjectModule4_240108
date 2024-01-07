package ra.controller;

import org.springframework.asm.SpringAsmInfo;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;
import ra.service.ProductService;
import ra.service.UserService;

@Controller
@RequestMapping("/countController")
public class CountController {
    @Autowired
    private UserService userService;
    @Autowired
    private ProductService productService;
    @GetMapping("/countData")
    public ModelAndView getDataCount(){
        ModelAndView mav = new ModelAndView("admin/dashboard");
        int userActive = userService.countUsersByStatusIsTrue();
        int userInactive = userService.countUsersByStatusIsFalse();
        mav.addObject("userActive",userActive);
        mav.addObject("userInactive",userInactive);
        return mav;
    }
}
