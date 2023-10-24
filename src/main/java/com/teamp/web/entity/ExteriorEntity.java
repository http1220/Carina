package com.teamp.web.entity;

import lombok.Data;

import java.util.*;

import javax.persistence.*;

@Entity
@Table(name = "exterior")
@Data
public class ExteriorEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "exterior_no")
    private int exteriorno;
    
    @Column(name = "sunroof")
    private boolean sunroof;

    @Column(name = "panoramic_sunroof")
    private boolean panoramicsunroof;
    
    @Column(name = "aluminum_wheels")
    private boolean aluminumwheels;
    
    @Column(name = "power_side_mirror")
    private boolean powersidemirror;
    
    @Column(name = "hid_lamps")
    private boolean hidlamps;
    
    @Column(name = "led_headlamps")
    private boolean ledheadlamps;
    
    @Column(name = "adaptive_headlamps")
    private boolean adaptiveheadlamps;
    
    @Column(name = "led_rear_lamps")
    private boolean ledrearlamps;
    
    @Column(name = "daytime_lights")
    private boolean daytimelights;
    
    @Column(name = "high_beam_assist")
    private boolean highbeamassist;
    
    @Column(name = "compression_door")
    private boolean compressiondoor;
    
    @Column(name = "automatic_sliding_door")
    private boolean automaticslidingdoor;
    
    @Column(name = "power_side_step")
    private boolean powersidestep;
    
    @Column(name = "roof_rack")
    private boolean roofrack;
    
    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "vehicle_no", referencedColumnName = "vehicle_no")
    private VehicleInformationEntity vehicleInformationEntity;
    
}

 
 