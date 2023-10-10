package com.team3.project1.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team3.project1.domain.stationListDTO;
import com.team3.project1.repository.stationListRepository;


@Service
public class stationListServiceImpl implements stationListService {
	@Autowired
	private stationListRepository stationlistRepository;
	
	public List<stationListDTO> getAllStationList() {
		// TODO Auto-generated method stub
		return stationlistRepository.getAllStationList();
	}

	public stationListDTO getTnumber(String tnumber) {
		stationListDTO trainnumber = stationlistRepository.getTnumber(tnumber);
		return trainnumber;
	}
}
