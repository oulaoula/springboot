import com.cnkrt.springbootmybatis.entity.Role;
import com.cnkrt.springbootmybatis.mapper.RoleMapper;
import org.junit.Assert;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.context.junit4.SpringRunner;

import java.util.List;

@RunWith(SpringRunner.class)
@SpringBootTest
public class test {
    @Autowired
    private RoleMapper roleMapper;

    @Test
    public void testS(){
        List<Role> roleList = roleMapper.selectList(null);
        Assert.assertEquals(5, roleList.size());
        for (Role role:roleList
             ) {
            System.out.println(role);
        }
    }
}
