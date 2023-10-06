package com.team3.project1.repository;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.team3.project1.domain.stationListDTO;

public class stationListRowMapper implements RowMapper<stationListDTO> {
	public stationListDTO mapRow(ResultSet rs, int rowNum) throws SQLException {
		stationListDTO stationlist = new stationListDTO();
		stationlist.setDivision(rs.getString(1));
		stationlist.setTnumber(rs.getString(2));
		stationlist.setStart(rs.getString(3));
		stationlist.setArrive(rs.getString(4));
		stationlist.setOperatingtime(rs.getString(5));
		
		return stationlist;
	}
}
