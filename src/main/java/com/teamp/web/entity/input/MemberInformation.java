package com.teamp.web.entity.input;
import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
@Entity
@Table(name = "member_information")
public class MemberInformation {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	@Column(name = "member_no")
	private int member_no;

	@Column(name = "membership_status")
	private int membership_status;

	@Column(name = "id")
	private String id;

	@Column(name = "password")
	private String pw1;

	@Column(name = "name")
	private String name;

	@Column(name = "gender")
	private String gender;

	@Column(name = "nickname")
	private String nickname;

	@Column(name = "email")
	private String email;

	@Column(name = "date_of_birth")
	@DateTimeFormat(pattern = "yyyy-MM-dd")
	private Date dateOfBirth;

	@Column(name = "phone_number")
	private String phoneNumber;
	
	@Column(name = "postcode")
	private String postcode;

	@Column(name = "address")
	private String address;
	
	@Column(name = "extra_address")
	private String extraAddress;
	
	@Column(name = "detail_address")
	private String detailAddress;

	@Column(name = "temporary_password")
	private String temporaryPassword;

	@Column(name = "interests")
	private String interests;

	//import java.util.Date;로 import해야 시분초까지 나온다 그렇지 않고 다른 Date를 import한다면 연월일까지만 나온다
	@Column(name = "join_date")
	private Date joinDate;

	@Column(name = "last_access_date")
	private Date last_access_date;

	@Column(name = "withdrawal_date")
	private Date withdrawal_date;

	@Column(name = "membership_grade")
	private Integer membershipGrade;

	@Column(name = "profile_picture")
	private String profile_picture;
	
//	@Column(name = "public_key")
//	private String publicKey;
//
//	@Column(name = "private_key")
//	private String privateKey;

}

