package it.eng.pathway.controller;

import java.util.Locale;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class ErrorController {
	
	@RequestMapping(value = "/error", method = RequestMethod.GET)
	public String simpleError(Model model, Locale locale){
		return "errorPage";
	}
	
	@RequestMapping(value = "/errorHDMS", method = RequestMethod.GET)
	public String simpleErrorHDMS(Model model, Locale locale){
		return "errorPageHDMS";
	}
	
	@RequestMapping(value = "/errorHDMSBC", method = RequestMethod.GET)
	public String simpleErrorHDMSBC(Model model, Locale locale){
		return "errorPageHDMSBC";
	}
	

}