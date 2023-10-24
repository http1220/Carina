package com.teamp.web.entity;

import java.util.ArrayList;
import java.util.List;

import javax.persistence.CascadeType;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;
import javax.persistence.Table;

import com.teamp.web.entity.input.Board;

import lombok.Data;

@Entity
@Table(name = "vehicle_information")
@Data
public class VehicleInformationEntity {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "vehicle_no")
    private int vehicleno;

    @Column(name = "color")
    private String color;

    @Column(name = "displacement")
    private int displacement;

    @Column(name = "domestic_import")
    private String domesticimport;

    @Column(name = "fuel_type")
    private String fueltype;

    @Column(name = "license_number")
    private String licensenumber;

    @Column(name = "manufacturer")
    private String manufacturer;

    @Column(name = "mileage")
    private int mileage;

    @Column(name = "model_name")
    private String modelname;

    @Column(name = "passenger_capacity")
    private int passengercapacity;

    @Column(name = "price")
    private int price;

    @Column(name = "transmission_type")
    private String transmissiontype;

    @Column(name = "vehicle_type")
    private String vehicletype;

    @Column(name = "wheel_type")
    private String wheeltype;

    @Column(name = "year_of_manufacture")
    private int yearofmanufacture;
    
    @Column(name = "contents")
    private String contents;

    @OneToMany(mappedBy = "vehicleInformationEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ConvenienceEntity> convenienceList = new ArrayList<>();

    @OneToMany(mappedBy = "vehicleInformationEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<ExteriorEntity> exteriorList = new ArrayList<>();

    @OneToMany(mappedBy = "vehicleInformationEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<InteriorEntity> interiorList = new ArrayList<>();

    @OneToMany(mappedBy = "vehicleInformationEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<MultimediaEntity> multimediaList = new ArrayList<>();

    @OneToMany(mappedBy = "vehicleInformationEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<SafetyEntity> safetyList = new ArrayList<>();

    @OneToMany(mappedBy = "vehicleInformationEntity", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<PhotoEntity> photoList = new ArrayList<>();
    
    @OneToMany(mappedBy = "vehicleInformation", cascade = CascadeType.ALL, orphanRemoval = true)
    private List<Board> boards;
}
   