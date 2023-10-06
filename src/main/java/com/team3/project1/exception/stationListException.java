package com.team3.project1.exception;

import org.springframework.web.bind.annotation.ResponseStatus;

import lombok.Data;

import org.springframework.http.HttpStatus;


@SuppressWarnings("serial")
public class stationListException extends RuntimeException {
	private String tnumber;

	public stationListException(String tnumber) {
		this.tnumber = tnumber;
	}
	
	public String getTnumber() {
		return tnumber;
	}
}
