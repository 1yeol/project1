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
public class seatDTO {
	@NonNull
	private String division; // 우등,일반석 구분
	@NonNull
	private int personnel; //인원
	@NonNull
	private String startStation; //출발역
	@NonNull
	private String arrvieStation; //도착역
	private String year; // 년
	private String month; // 월
	private String date; // 일
	private String hour; //시간
}
