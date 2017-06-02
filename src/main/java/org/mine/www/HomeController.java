package org.mine.www;

import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;
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
import org.springframework.web.bind.annotation.RequestParam;
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
	public String WordBookJSON(Model model)
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
	@RequestMapping(value="InsertWordBook", method=RequestMethod.GET,produces = "application/json; charset=utf8") //post
	public String InsertWordBook(@RequestParam("wordbook_word") String word,HttpServletRequest request){ //http request , request 값으로 받기 WordBookVO wordbook, @requestParam
		// ,@RequestParam("wordbook_wordCheck") String wordCheck
		System.out.println("컨트롤러 : 들어옴");
		// System.out.println("컨트롤러 : "+wordbook.toString());
		// System.out.println("컨트롤러 Request: "+request.getAttribute("wordbook_word"));
		// System.out.println("컨트롤러 Request: "+request.getSession());
		// 
		
		System.out.println("컨트롤러 @RequestParam: "+word);
		
		System.out.println("컨트롤러 : 서비스 갔다왔고 체크값을 JSP로 보낼거임");
		
		JSONObject json = new JSONObject();
		WordBookVO wordbook = new WordBookVO();
		
		wordbook.setWordbook_word(word);
		wordbook.setWordbook_wordcheck("1");
		
		int check = 1 ;//homeService.setWordBook(wordbook);
		
		if(check>0){
			json.put("check", true);
		}
		else{
			json.put("check", false);
		}
	
		return json.toString();
	}

}
