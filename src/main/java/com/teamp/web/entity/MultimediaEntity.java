package com.teamp.web.entity;

import lombok.Data;

import java.util.*;

import javax.persistence.*;


@Entity
@Table(name = "multimedia")
@Data
public class MultimediaEntity {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "multimedia_no")
    private int multimediano;

    @Column(name = "genuine_navigation")
    private boolean genuinenavigation;

    @Column(name = "aftermarket_navigation")
    private boolean aftermarketnavigation;

    @Column(name = "usb")
    private boolean usb;

    @Column(name = "aux")
    private boolean aux;

    @Column(name = "bluetooth")
    private boolean bluetooth;

    @Column(name = "mp3")
    private boolean mp3;

    @Column(name = "dmb")
    private boolean dmb;

    @Column(name = "cd_player")
    private boolean cdplayer;

    @Column(name = "av_system")
    private boolean avsystem;

    @Column(name = "rear_seat_tv")
    private boolean rearseattv;

    @Column(name = "telematics")
    private boolean telematics;

    @Column(name = "smartphone_mirroring")
    private boolean smartphonemirroring;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "vehicle_no", referencedColumnName = "vehicle_no")
    private VehicleInformationEntity vehicleInformationEntity;
}

 