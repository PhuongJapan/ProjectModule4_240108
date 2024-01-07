package ra.config;

import org.springframework.web.servlet.support.AbstractAnnotationConfigDispatcherServletInitializer;

public class webConfig extends AbstractAnnotationConfigDispatcherServletInitializer {
    @Override
    protected Class<?>[] getRootConfigClasses() {
        return new Class[0];
    }

    @Override
    protected Class<?>[] getServletConfigClasses() {
        //Đọc file cấu hình là appConfig
        return new Class[]{appConfig.class};
    }

    @Override
    protected String[] getServletMappings() {
        //Đường dẫn gốc localhost
        return new String[]{"/"};
    }
}
