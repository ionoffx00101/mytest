package org.mine.www;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.inject.Named;

import org.mine.www.service.HomeService;
import org.mine.www.vo.WordBookVO;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController
{

	@Inject
	@Named("homeService")
	private HomeService homeService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model)
	{

	/*	List<WordBookVO> list = homeService.getWordBook();
		model.addAttribute("wordBook", list);
*/
		return "index";
	}
	
	@ResponseBody
	@RequestMapping(value="WordBookJSON", method= RequestMethod.POST)
	public String WordBookJSON(Model model)
	{
		List<WordBookVO> list = homeService.getWordBook();

		// 이 클래스 호출 잘 됨 
		// 이제 되돌려주는게 문제인것 같
		model.addAttribute("wordBook", list);
		
		System.out.println(list.get(0).getWordbook_num());
		
		return "{\"num\":"+list.get(0).getWordbook_num()+",\"word\":"+list.get(0).getWordbook_word()+"}"; /*"redirect:경로"*/
	}
	
	
	@RequestMapping(value="WordBookJSONTest", method= RequestMethod.POST)
	public @ResponseBody ArrayList<WordBookVO>/* List<WordBookVO>*/ WordBookJSONTest(Model model)
	{
		ArrayList<WordBookVO> list = (ArrayList)homeService.getWordBook();

		// 이 클래스 호출 잘 됨 
		// 이제 되돌려주는게 문제인것 같
		//model.addAttribute("wordBook", list);
		
		return list /*list*/; /*"redirect:경로"*/
	}
	
	@ResponseBody
	@RequestMapping(value="empInsert", method=RequestMethod.POST)
	public String InsertWordBook(WordBookVO wordbook){
		
		int check = homeService.setWordBook(wordbook);
		// int 값이 돌아오는 걸 보고 잘 들어갔는지 못 들어갔는 지 확인할 수 있음
		// 0이 ㄴㄴ 고 1이 ㅇㅋ였나
		// -1 1 이였나 그게 좀 기억 안 날뿐임
		return "index";
	}

}
