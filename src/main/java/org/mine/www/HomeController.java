package org.mine.www;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpServletResponse;
import javax.xml.ws.Response;

import org.json.JSONArray;
import org.json.JSONObject;
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
		return "index";
	}
	
	@ResponseBody
	@RequestMapping(value="WordBookJSON", method= RequestMethod.POST,produces = "application/json; charset=utf8")
	public String WordBookJSON(Model model,HttpServletResponse response)
	{
		List<WordBookVO> list = homeService.getWordBook();
		JSONArray jsonArr = new JSONArray();
		
		for (int i = 0; i < list.size(); i++)
		{
			JSONObject json = new JSONObject();
			WordBookVO vo = list.get(i);
			json.put("num", vo.getWordbook_num());
			json.put("word", vo.getWordbook_word());
			json.put("check", vo.getWordbook_wordcheck());
			
			jsonArr.put(json); // [{"num":1,"check":"1","word":"멍멍이"}]
			//jsonArr.put(vo); // "[WordBookVO [wordbook_num=1, wordbook_word=멍멍이, wordbook_wordcheck=1]]"
		}
		return jsonArr.toString(); /*"redirect:경로"*/
	}
	
	@ResponseBody
	@RequestMapping(value="empInsert", method=RequestMethod.POST)
	public String InsertWordBook(WordBookVO wordbook){ //http request , request 값으로 받기
		System.out.println("컨트롤러 : 들어옴");
		int check = homeService.setWordBook(wordbook);
		// int 값이 돌아오는 걸 보고 잘 들어갔는지 못 들어갔는 지 확인할 수 있음
		// 0이 ㄴㄴ 고 1이 ㅇㅋ였나
		// -1 1 이였나 그게 좀 기억 안 날뿐임
		System.out.println("컨트롤러 : 서비스 갔다왔고 체크값을 JSP로 보낼거임");
		return "[{\"check\":\""+check+"\"}]";
	}

}
