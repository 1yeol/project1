package com.team3.project1.domain;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;

@Data
@NoArgsConstructor
@RequiredArgsConstructor
@AllArgsConstructor
public class stationListDTO {
	@NonNull
	private String division; //구분
	@NonNull
	private String tnumber; //열차번호
	private String start; //출발
	private String arrive; //도착
	private String operatingtime; //소요시간	
}
