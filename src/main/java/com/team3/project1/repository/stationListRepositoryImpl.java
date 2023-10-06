package com.team3.project1.repository;

import java.util.ArrayList;
import java.util.List;

import javax.sql.DataSource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import com.team3.project1.domain.stationListDTO;
import com.team3.project1.exception.stationListException;

@Repository
public class stationListRepositoryImpl implements stationListRepository {
	
	private JdbcTemplate template;
	
	@Autowired
	public void setJdbctemplate(DataSource dataSource) {
		this.template = new JdbcTemplate(dataSource);
	}
	
	
//	private List<stationListDTO> listofStations = new ArrayList<stationListDTO>();
//	
//	public stationListRepositoryImpl() {
//		stationListDTO sldto1 = new stationListDTO("직통", "KTX-111", "서울 09:00" ,"부산 12:00", "02:36");
//		stationListDTO sldto2 = new stationListDTO("직통", "KTX-222", "서울 10:00" ,"부산 13:00", "02:36");
//		stationListDTO sldto3 = new stationListDTO("직통", "KTX-333", "서울 11:00" ,"부산 14:00", "02:36");
//		
//		listofStations.add(sldto1);
//		listofStations.add(sldto2);
//		listofStations.add(sldto3);
//		
//	}
//	
//	public stationListDTO getstationListByTnumber(String tnumber) {
//		stationListDTO sltnumber = null;
//		for(int i=0; i < listofStations.size(); i++) {
//			stationListDTO station = listofStations.get(i);
//			if(station != null && station.getTnumber() != null && station.getTnumber().equals(tnumber)) {
//				sltnumber = station;
//				break;
//			}
//		}
//		if(sltnumber == null) {
//			throw new stationListException(tnumber);
//		}
//		return sltnumber;
//	}
	
	@Override
	public List<stationListDTO> getAllStationList() {
		String SQL = "SELECT * FROM stationlist";
		List<stationListDTO> listOfStations = template.query(SQL, new stationListRowMapper());
		return listOfStations;
	}
	
	public stationListDTO getTnumber(String tnumber) {
		stationListDTO tnumberinfo = null;
		String SQL = "SELECT count(*) FROM stationlist where tnumber=?";
		int rowCount = template.queryForObject(SQL, Integer.class, tnumber);
		if(rowCount != 0) {
			SQL = "SELECT * FROM stationlist where tnumber=?";
			
			tnumberinfo = template.queryForObject(SQL, new Object[] {tnumber}, new stationListRowMapper());
		}
		
		if(tnumberinfo == null) {
			throw new stationListException(tnumber);
		}
		
		return tnumberinfo;
	}

}
