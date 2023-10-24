package com.teamp.web.entity.output;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

import lombok.Data;

@Entity
@Data
@Table(name = "search_page_view")
public class SearchPageView {
	
	@Id
	@Column(name="vehicle_no")
	private int vehicleno;	
	
	@Column(name="model_name")
	private String modelname;
	
	@Column(name="year_of_manufacture")
	private String year;

	@Column(name="fuel_type")
	private String fueltype;
	
	@Column(name="vehicle_type")
	private String vehicletype;
	
	@Column(name="transmission_type")
	private String transmissiontype;
	
	@Column(name="domestic_import")
	private String domesticimport;
	
    @Column(name = "isdelete")
    private Integer isdelete;
	
	@Column(name="wheel_type")
	private String wheeltype;
	
	@Column(name="passenger_capacity")
	private String passengercapacity;
	
	@Column(name="registration_date")
	private Date regidate;
	
	private String manufacturer, color, nickname, thumbnail;
	private int mileage, displacement, price, b_no, views;
}
