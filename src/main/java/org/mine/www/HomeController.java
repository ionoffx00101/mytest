package org.mine.www;

import java.io.BufferedReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.PrintWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URI;
import java.net.URL;
import java.net.URLConnection;
import java.security.Security;
import java.text.DateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Locale;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
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
	public String home(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		String tistoryJson = getTistory();
		model.addAttribute("tistoryJson", tistoryJson); //  이 이름으로 받으면 메인 페이지에서 데이터를 볼 수 있을 것이다. 
		return "index";
	}
	
	// 임시
	@RequestMapping(value = "metro", method = RequestMethod.GET)
	public String metro(Locale locale, Model model, HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		return "metro";
	}

	@ResponseBody
	@RequestMapping(value = "WordBookJSON", method = RequestMethod.POST, produces = "application/json; charset=utf8")
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
		return jsonArr.toString(); /* "redirect:경로" */
	}

	@ResponseBody
	@RequestMapping(value = "InsertWordBook", method = RequestMethod.GET, produces = "application/json; charset=utf8") //post
	public String InsertWordBook(WordBookVO wordbook, Model model, HttpServletRequest request)
	{
		boolean check = homeService.setWordBook(wordbook) > 0 ? true : false; // = 1 ;

		JSONObject json = new JSONObject();
		json.put("check", check);
		return json.toString();
	}

	@RequestMapping(value = "getAccessCode", method = RequestMethod.GET, produces = "application/json; charset=utf8") //post
	public String getAccessCode(WordBookVO wordbook, Model model, HttpServletRequest request)
	{
		// 1 html 열기 
		// 2 인증 버튼 누르기
		// 3 code 뒤에 값 복사
		// 4 자바코드에 넣기
		// 5 자바 클래스 실행
		// 6 웹으로 토큰 나옴
		// 7 코드 복사 
		// 8 엑세스 넣어야하는 곳에 넣기
		// 9 실행 
		return "request_authorization_code";
	}

	public String getTistory()
	{
		// 클라이언트 인증받아서 access_token 나오면 그때 받아오는 거 하기
		String client_id = "a5bffb32c3f38197aa7b8702e9eba13b";
		String access_url = "https://www.tistory.com/oauth/authorize/";

		String access_token = "16a64460b8e806090590e226aeb9c656_cc2ca422f94f3d2c4959f40025d28f21";
		String url = "https://www.tistory.com/apis/post/list";

		String output = "json";
		String blogName = "teqoo";
		String targetUrl = ""; // 2차도메인 안쓰니까 필요없을 것같다

		String perfectUrl = url + "?" + "access_token=" + access_token + "&" + "blogName=" + blogName + "&" + "output=" + output;

		try
		{

			URL connectUrl = new URL(perfectUrl);
			HttpURLConnection con = (HttpURLConnection) connectUrl.openConnection();
			con.setRequestMethod("GET");

			int responseCode = con.getResponseCode();
			BufferedReader br;
			if (responseCode == 200)
			{ // 정상 호출
				br = new BufferedReader(new InputStreamReader(con.getInputStream()));
			} else
			{ // 에러 발생
				br = new BufferedReader(new InputStreamReader(con.getErrorStream()));
			}

			String inputLine;
			StringBuffer sb = new StringBuffer();
			while ((inputLine = br.readLine()) != null)
			{
				//br.readLine()가 널이 아닐때만 inputLine에 br.readLine()값 집어넣고 while문 실행
				sb.append(inputLine);
			}
			br.close();
			//System.out.println(sb.toString());
			// sb 로 뭔가를 하면 됨 그럼?
			return sb.toString();

		} catch (MalformedURLException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e)
		{
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return "저런..";
	}

	public void processRequest(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
	{
		response.setContentType("text/html;charset=UTF-8");
		PrintWriter out = response.getWriter();

		try
		{

			/**
			 * OAuth2.0 단계중 Authorization code callback 및 Access Token 발급의 간단 예제
			 */

			String authorization_code = "d7b1557cd98846180621248779d36088e99cfd2bdb68f219266c16024f26a52d83301dd4";//request.getParameter("code"); //최초 발급 요청으로 부터 받은 authorization code 입력

			String clientId = "a5bffb32c3f38197aa7b8702e9eba13b";
			String clientSecret = "a5bffb32c3f38197aa7b8702e9eba13b6ec255a4a6051243fdb23c6572dc1327d5c6953f";
			String redirectUri = "http://teqoo.tistory.com/";
			String grantType = "authorization_code";

			String requestUrl = "https://www.tistory.com/oauth/access_token/?code=" + authorization_code + "&client_id=" + clientId
					+ "&client_secret=" + clientSecret + "&redirect_uri=" + redirectUri + "&grant_type=" + grantType;

			try
			{

				System.setProperty("java.protocol.handler.pkgs", "com.sun.net.ssl.internal.www.protocol");
				com.sun.net.ssl.internal.ssl.Provider provider = new com.sun.net.ssl.internal.ssl.Provider();
				Security.addProvider(provider);

				URL url = new URL(requestUrl);
				URLConnection connection = url.openConnection();

				InputStream is = connection.getInputStream();
				InputStreamReader isr = new InputStreamReader(is);
				BufferedReader br = new BufferedReader(isr);

				out.println(br.readLine()); // 데이터를 콘솔창에 보여주는 곳

			} catch (Exception e)
			{
				e.printStackTrace();
			}

		} finally
		{
			out.close();

		}

	}
}
