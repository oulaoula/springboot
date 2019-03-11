package com.cnkrt.springbootmybatis.controller;


        import com.cnkrt.springbootmybatis.entity.Role;
        import com.cnkrt.springbootmybatis.mapper.RoleMapper;
        import org.springframework.beans.factory.annotation.Autowired;
        import org.springframework.web.bind.annotation.RequestMapping;

        import org.springframework.stereotype.Controller;
        import org.springframework.web.bind.annotation.ResponseBody;

        import java.util.List;

/**
 * <p>
 *  前端控制器
 * </p>
 *
 * @author kick
 * @since 2019-03-08
 */
@Controller
public class RoleController {
    @Autowired
    private RoleMapper roleMapper;

}
