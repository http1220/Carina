package com.teamp.web.entity;

import lombok.Data;

import java.util.*;

import javax.persistence.*;

@Entity
@Table(name = "interior")
@Data
 public class InteriorEntity {

	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "interior_no")
    private int interiorno;

	@Column(name = "leather_seats")
	private boolean leatherseats;

	@Column(name = "power_seat_driver")
	private boolean powerseatdriver;

	@Column(name = "power_seat_passenger")
	private boolean powerseatpassenger;

	@Column(name = "heated_seat_front")
	private boolean heatedseatfront;

	@Column(name = "heated_seat_rear")
	private boolean heatedseatrear;

	@Column(name = "ventilated_seats")
	private boolean ventilatedseats;

	@Column(name = "memory_seats")
	private boolean memoryseats;

	@Column(name = "folding_seats")
	private boolean foldingseats;

	@Column(name = "massage_seats")
	private boolean massageseats;

	@Column(name = "walk_in_seat")
	private boolean walkinseat;

	@Column(name = "lumbar_support")
	private boolean lumbarsupport;

	@Column(name = "high_pass_room_mirror")
	private boolean highpassroommirror;

	@Column(name = "ecm_room_mirror")
	private boolean ecmroommirror;

	@Column(name = "rear_seat_vents")
	private boolean rearseatvents;

	@Column(name = "paddle_shift")
	private boolean paddleshift;

	@Column(name = "power_sunshade")
	private boolean powersunshade;

	@Column(name = "ambient_lighting")
	private boolean ambientlighting;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "vehicle_no", referencedColumnName = "vehicle_no")
    private VehicleInformationEntity vehicleInformationEntity;
}
 