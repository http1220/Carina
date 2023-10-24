package com.teamp.web.entity;

import lombok.Data;

import javax.persistence.*;

@Entity
@Table(name = "photo")
@Data
public class PhotoEntity {

    @Id
    @Column(name = "photo_no")
    private int photono;
    
    @Column(name = "thumbnail")
    private String thumbnail;

    @Column(name = "front")
    private String front;

    @Column(name = "side")
    private String side;

    @Column(name = "back")
    private String back;

    @Column(name = "inside_front")
    private String insideFront;

    @Column(name = "inside_back")
    private String insideBack;

    @Column(name = "engine_room")
    private String engineRoom;

    @Column(name = "trunk")
    private String trunk;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "vehicle_no", referencedColumnName = "vehicle_no")
    private VehicleInformationEntity vehicleInformationEntity;

	public void setPhotoPath(int i, String filePath) {
		// TODO Auto-generated method stub
		
	}
}
