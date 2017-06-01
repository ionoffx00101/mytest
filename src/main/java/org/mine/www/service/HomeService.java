package org.mine.www.service;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.mine.www.dao.HomeDAO;
import org.mine.www.vo.WordBookVO;
import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.stereotype.Service;

@Service(value="homeService")
public class HomeService
{
	@Inject
	@Named(value="sqlSessionTemplate")
	private SqlSessionTemplate sqlSessionTemplate; // 설정파일에 빈으로 등록되었기 때문에 생성자나 Setter 없이 자동으로 주입
	
	public List<WordBookVO> getWordBook(){
		System.out.println("1");
		System.out.println(sqlSessionTemplate.getConnection());
		
		
		HomeDAO dao = sqlSessionTemplate.getMapper(HomeDAO.class);
		System.out.println("2");
		List<WordBookVO> list = dao.getList();
		System.out.println("3");
		return list;

	}
}
