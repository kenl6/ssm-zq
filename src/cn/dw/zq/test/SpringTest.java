package cn.dw.zq.test;

import org.springframework.beans.factory.BeanFactory;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import cn.dw.zq.model.Role;
import cn.dw.zq.service.RoleService;

/**
 * @author Ken.Leung
 * @version 2018年8月29日 下午3:26:30
 * 
 */
public class SpringTest {

	public static void main(String[] args) {
		BeanFactory beanFactory = new ClassPathXmlApplicationContext("classpath:application.xml");
		RoleService roleService = (RoleService) beanFactory.getBean("roleService");
		Role role = new Role();
		role.setName("李四");
		role.setRemarks("1234");
		roleService.add(role);
	}

}
