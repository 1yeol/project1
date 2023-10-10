package com.team3.project1.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ExceptionHandler;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.team3.project1.domain.stationListDTO;
import com.team3.project1.exception.stationListException;
import com.team3.project1.service.stationListService;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
public class stationListController {
	@Autowired
	private stationListService stationlistService;
	
	@RequestMapping(value="/stationlist", method=RequestMethod.GET)
	public String requestStationList(Model model) {
		List<stationListDTO> list = stationlistService.getAllStationList();
		
		model.addAttribute("stationList", list);
		return "list/stationlist";
	}
	
	
	
	@GetMapping("/charge")
	public String charge(@RequestParam("id") String tnumber, Model model) {
		stationListDTO tnumbernumber = stationlistService.getTnumber(tnumber);
		model.addAttribute("charge", tnumbernumber);
		return "list/charge";
	}
	
	@GetMapping("/first")
	public String first() {
		return "list/first";
	}
	
	@GetMapping("/standard")
	public String standard() {
		return "list/standard";
	}
	
	@ExceptionHandler(value= {stationListException.class})
	public ModelAndView handleError(HttpServletRequest req, stationListException exception) {
		ModelAndView mav = new ModelAndView();
		mav.addObject("invalidTnumber", exception.getTnumber());
		mav.addObject("exception", exception);
		mav.addObject("url", req.getRequestURL() + "?" + req.getQueryString());
		mav.setViewName("errorStationlist");
		return mav;
	}
	

}
