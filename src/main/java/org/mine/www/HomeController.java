package org.mine.www;

import java.text.DateFormat;
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

/**
 * Handles requests for the application home page.
 */
@Controller
public class HomeController {
	
	@Inject
	@Named("homeService")
	private HomeService homeService;

	@RequestMapping(value = "/", method = RequestMethod.GET)
	public String home(Locale locale, Model model) {
		
		System.out.println("4");
		
		List<WordBookVO> list = homeService.getWordBook();
		model.addAttribute("List", list);
		
		return "index";
	}
	
}
