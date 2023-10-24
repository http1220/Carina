package com.teamp.web.entity;

import lombok.Data;

import java.util.*;

import javax.persistence.*;


@Entity
@Table(name = "safety")
@Data
public class SafetyEntity {
	
@Id
@GeneratedValue(strategy = GenerationType.IDENTITY)
@Column(name = "safety_no")
private int safetyno;

@Column(name = "curtain_airbags")
private boolean curtainairbags;

@Column(name = "knee_airbags")
private boolean kneeairbags;

@Column(name = "passenger_airbags")
private boolean passengerairbags;

@Column(name = "abs")
private boolean abs;

@Column(name = "esc")
private boolean esc;

@Column(name = "rear_sensors")
private boolean rearsensors;

@Column(name = "front_sensors")
private boolean frontsensors;

@Column(name = "rear_camera")
private boolean rearcamera;

@Column(name = "front_camera")
private boolean frontcamera;

@Column(name = "around_view")
private boolean aroundview;

@Column(name = "tpms")
private boolean tpms;

@Column(name = "ldws")
private boolean ldws;

@Column(name = "aeb")
private boolean aeb;

@Column(name = "ecs")
private boolean ecs;

@Column(name = "rear_cross_traffic_alert")
private boolean rearcrosstrafficalert;

@Column(name = "tcs")
private boolean tcs;

@ManyToOne(fetch = FetchType.LAZY)
@JoinColumn(name = "vehicle_no", referencedColumnName = "vehicle_no")
private VehicleInformationEntity vehicleInformationEntity;
}

