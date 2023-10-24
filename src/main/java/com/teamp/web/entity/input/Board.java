package com.teamp.web.entity.input;

import java.sql.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import com.teamp.web.entity.VehicleInformationEntity;

import lombok.Data;

@Entity
@Data
@Table(name = "board")
public class Board {

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    @Column(name = "b_no")
    private int bno;

    @Column(name = "nickname")
    private String nickname;

    @Column(name = "views")
    private Integer views;

    @Column(name = "isdelete")
    private Integer isdelete;

    @Column(name = "transaction_date")
    private Date transactionDate;

    @Column(name = "transaction_location")
    private String transactionLocation;

    @Column(name = "registration_date")
    private Date registrationDate;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "vehicle_no", referencedColumnName = "vehicle_no")
    private VehicleInformationEntity vehicleInformation;
    // 생성자, getter/setter, toString 등 생략
    
    public VehicleInformationEntity getVehicleInformation() {
        return null;
    }
    

}

