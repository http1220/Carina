package com.teamp.web.entity.output;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;
import lombok.ToString;

@ToString
@Data
@Builder
@AllArgsConstructor
@NoArgsConstructor
@Table(name = "detail_page_view")
@Entity

public class DetailPageViewEntity {
	
	@Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name= "nickname")
	private String nickname;
	
	@Column(name= "b_no")
	private int bno;
			
	@Column(name= "vehicle_no")
	private int vehicleno;
	
	@Column(name= "views")
	private int views;
	
	@Column(name= "transaction_date")
	private Date transactiondate;
	
	@Column(name= "transaction_location")
	private String transactionlocation;
	
	@Column(name= "phone_number")
	private String phonenumber;
	
	
			
}
