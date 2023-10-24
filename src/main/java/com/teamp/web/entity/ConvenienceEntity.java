package com.teamp.web.entity;

import lombok.Data;

import java.util.*;

import javax.persistence.*;


@Entity
@Table(name = "convenience")
@Data
public class ConvenienceEntity {
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "convenience_no")
    private int convenienceno;

@Column(name = "smart_key")
private boolean smartkey;

@Column(name = "heated_steering_wheel")
private boolean heatedsteeringwheel;

@Column(name = "remote_control_steering_wheel")
private boolean remotecontrolsteeringwheel;

@Column(name = "automatic_air_conditioning")
private boolean automaticairconditioning;

@Column(name = "dual_zone_air_conditioning")
private boolean dualzoneairconditioning;

@Column(name = "auto_headlights")
private boolean autoheadlights;

@Column(name = "cruise_control")
private boolean cruisecontrol;

@Column(name = "smart_cruise_control")
private boolean smartcruisecontrol;

@Column(name = "stop_and_go")
private boolean stopandgo;

@Column(name = "power_trunk")
private boolean powertrunk;

@Column(name = "smart_trunk")
private boolean smarttrunk;

@Column(name = "electronic_parking_brake")
private boolean electronicparkingbrake;

@Column(name = "hill_start_assist")
private boolean hillstartassist;

@Column(name = "head_up_display")
private boolean headupdisplay;

@Column(name = "wireless_charging")
private boolean wirelesscharging;

@Column(name = "automatic_parking")
private boolean automaticparking;

@Column(name = "refrigerator")
private boolean refrigerator;

@ManyToOne(fetch = FetchType.LAZY)
@JoinColumn(name = "vehicle_no", referencedColumnName = "vehicle_no")
private VehicleInformationEntity vehicleInformationEntity;
}