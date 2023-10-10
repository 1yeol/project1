package com.team3.project1.controller;

import java.util.List;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.team3.project1.domain.stationListDTO;

import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequiredArgsConstructor
public class reservationController {
	@RequestMapping(value="/reservation", method=RequestMethod.GET)
	public String requestStationList() {
		
		return "book/NewTrain";
	}
}
