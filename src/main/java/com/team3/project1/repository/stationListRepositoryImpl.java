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
