
package com.teamp.web.controller;

import java.util.List;

import javax.servlet.http.Cookie;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.teamp.web.entity.ConvenienceEntity;
import com.teamp.web.entity.ExteriorEntity;
import com.teamp.web.entity.InteriorEntity;
import com.teamp.web.entity.MultimediaEntity;
import com.teamp.web.entity.PhotoEntity;
import com.teamp.web.entity.SafetyEntity;
import com.teamp.web.entity.VehicleInformationEntity;
import com.teamp.web.entity.output.DetailPageViewEntity;
import com.teamp.web.service.DetailService;

@Controller
public class DetailController {

	@Autowired
	private DetailService detailService;
	
	@GetMapping("/detail")
	public ModelAndView detail(@RequestParam("vehicleno") int vehicleno
//								, @RequestParam("thumbnail") String thumbnail
								, HttpServletRequest request
								, HttpServletResponse response) {
						
		ModelAndView mv = new ModelAndView("detail");

		List<PhotoEntity> listDetail = detailService.findPhotoByPhotono(vehicleno); // findAll() : 모든 db 불러오기
		mv.addObject("list", listDetail);

		List<VehicleInformationEntity> listVehicle = detailService.findVehicleInformationByVehicleno(vehicleno);
		mv.addObject("vehicle", listVehicle);

		List<ExteriorEntity> listExterior = detailService.findExteriorByExteriorno(vehicleno);
		mv.addObject("exterior", listExterior);

		List<InteriorEntity> listInterior = detailService.findInteriorByInteriorno(vehicleno);
		mv.addObject("interior", listInterior);

		List<SafetyEntity> listSafety = detailService.findSafetyBySafetyno(vehicleno);
		mv.addObject("safety", listSafety);

		List<ConvenienceEntity> listConvenience = detailService.findConvenienceByConvenienceno(vehicleno);
		mv.addObject("convenience", listConvenience);

		List<MultimediaEntity> listMultimedia = detailService.findMultimediaByMultimediano(vehicleno);
		mv.addObject("multimedia", listMultimedia);

		List<DetailPageViewEntity> listDetailpage = detailService.findDetailpageviewByBno(vehicleno);
		mv.addObject("detailpage", listDetailpage);
				
		
		DetailPageViewEntity entity = detailService.findDetailPageViewEntityByVehicleno(vehicleno);

		// 쿠키 생성

		Cookie oldCookie = null;

		Cookie[] cookies = request.getCookies();
		if (cookies != null) {
			for (Cookie cookie : cookies) {
				if (cookie.getName().equals("postView")) {
					oldCookie = cookie;
				}
			}
		}

		if (oldCookie != null) {
			if (!oldCookie.getValue().contains("[" + String.valueOf(vehicleno) + "]")) {
				detailService.updateView(vehicleno);
				oldCookie.setValue(oldCookie.getValue() + "_[" + vehicleno + "]");
				oldCookie.setPath("/");
				oldCookie.setMaxAge(60 * 60 * 24);
				response.addCookie(oldCookie);
			}
		} else {

			detailService.updateView(vehicleno);
			Cookie newCookie = new Cookie("postView", "[" + vehicleno + "]");
			newCookie.setPath("/");
			newCookie.setMaxAge(60 * 60 * 24);
			response.addCookie(newCookie);
		}

//		String thumbNail = thumbnail;
		String vehicleNo = Integer.toString(vehicleno);

		if (vehicleNo != null) {
		    // Retrieve cookies from the request
		    Cookie[] cookies1 = request.getCookies();
		    boolean[] existingCookies = new boolean[5];
		    boolean vehicleNoExists = false;

		    // Check existing cookies
		    if (cookies1 != null) {
		        for (Cookie cookie : cookies1) {
		            if (cookie.getName().startsWith("vehicleNo")) {
		                int index = Integer.parseInt(cookie.getName().substring("vehicleNo".length()));
		                if (index >= 1 && index <= 5) {
		                    existingCookies[index - 1] = true;
		                    if (vehicleNo.equals(cookie.getValue())) {
		                        vehicleNoExists = true;
		                        break;
		                    }
		                }
		            }
		        }
		    }

		    // Create new cookies if needed and vehicleNo is not duplicated
		    if (!vehicleNoExists) {
		        for (int i = 0; i < 5; i++) {
		            if (!existingCookies[i]) {
		                Cookie vehicle = new Cookie("vehicleNo" + (i + 1), vehicleNo);
		                vehicle.setMaxAge(60 * 60 * 24 * 7);
		                vehicle.setDomain("localhost");
		                vehicle.setPath("/");
		                response.addCookie(vehicle);
		                
//		                Cookie thumb = new Cookie("thumbnail" + (i + 1), thumbNail);
//		                thumb.setMaxAge(60 * 60 * 24 * 7);
//		                thumb.setDomain("localhost");
//		                thumb.setPath("/");
//		                response.addCookie(thumb);

						break; // Exit the loop after creating one set of cookies
					}
				}
			}
		}
		return mv;
	
	}
	}

