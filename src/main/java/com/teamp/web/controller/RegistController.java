package com.teamp.web.controller;

import java.io.File;
import java.io.IOException;
import java.sql.Date;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.EntityTransaction;
import javax.persistence.Persistence;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import com.teamp.web.entity.ConvenienceEntity;
import com.teamp.web.entity.ExteriorEntity;
import com.teamp.web.entity.InteriorEntity;
import com.teamp.web.entity.MultimediaEntity;
import com.teamp.web.entity.PhotoEntity;
import com.teamp.web.entity.SafetyEntity;
import com.teamp.web.entity.VehicleInformationEntity;
import com.teamp.web.entity.input.Board;
import com.teamp.web.service.RegistService;

import lombok.RequiredArgsConstructor;

@Controller
@RequiredArgsConstructor
public class RegistController {
	
	@Autowired
	RegistService registService;
	@GetMapping("/regist")
	public String regist(HttpServletRequest request) {
	    HttpSession session = request.getSession();
	    if (session.getAttribute("id") != null) {
	        // User is logged in, redirect to regist page
	        return "regist";
	    } else {
	        // User is not logged in, redirect to login page
	        return "redirect:/login";
	    }
	}
	
	
	@PostMapping("/regist")
    public String regist( HttpServletRequest request
    					, @ModelAttribute VehicleInformationEntity vehicleInformation
    					, @ModelAttribute ConvenienceEntity convenience
    					, @ModelAttribute ExteriorEntity exterior
    					, @ModelAttribute InteriorEntity interior
    					, @ModelAttribute MultimediaEntity multimedia
    					, @ModelAttribute SafetyEntity safety
    					, Model model
    				    , @RequestParam("thumbnail") MultipartFile thumbnail
    				    , @RequestParam("front") MultipartFile front
    				    , @RequestParam("side") MultipartFile side
    				    , @RequestParam("back") MultipartFile back
    				    , @RequestParam("inside_front") MultipartFile inside_front
    				    , @RequestParam("inside_back") MultipartFile inside_back
    				    , @RequestParam("engine_room") MultipartFile engine_room
    				    , @RequestParam("trunk") MultipartFile trunk
    				    , HttpSession httpSession
                        )  {  

		try {
			System.err.println("try문");
			VehicleInformationEntity savedVehicleInformation = registService.insertVi(vehicleInformation);
			
			
	        String vehicleNo = Integer.toString(savedVehicleInformation.getVehicleno());
	        saveFile(thumbnail, vehicleNo, "thumbnail");
	        saveFile(front, vehicleNo, "front");
	        saveFile(side, vehicleNo, "side");
	        saveFile(back, vehicleNo, "back");
	        saveFile(inside_front, vehicleNo, "inside_front");
	        saveFile(inside_back, vehicleNo, "inside_back");
	        saveFile(engine_room, vehicleNo, "engine_room");
	        saveFile(trunk, vehicleNo, "trunk");

	        
	        
	        
	        PhotoEntity photo = new PhotoEntity();
	        photo.setThumbnail("/img/cars/" + vehicleNo + "/thumbnail" +"." +FilenameUtils.getExtension(thumbnail.getOriginalFilename()));
	        photo.setFront("/img/cars/" + vehicleNo + "/front"+"." +FilenameUtils.getExtension(front.getOriginalFilename()));
	        photo.setSide("/img/cars/" + vehicleNo + "/side"+"." +FilenameUtils.getExtension(side.getOriginalFilename()));
	        photo.setBack("/img/cars/" + vehicleNo + "/back"+"." +FilenameUtils.getExtension(back.getOriginalFilename()));
	        photo.setInsideFront("/img/cars/" + vehicleNo + "/inside_front"+"." +FilenameUtils.getExtension(inside_front.getOriginalFilename()));
	        photo.setInsideBack("/img/cars/" + vehicleNo + "/inside_back"+"." +FilenameUtils.getExtension(inside_back.getOriginalFilename()));
	        photo.setEngineRoom("/img/cars/" + vehicleNo + "/engine_room"+"." +FilenameUtils.getExtension(engine_room.getOriginalFilename()));
	        photo.setTrunk("/img/cars/" + vehicleNo + "/trunk"+"." +FilenameUtils.getExtension(trunk.getOriginalFilename()));
	        photo.setVehicleInformationEntity(vehicleInformation);

	        registService.insertPo(photo);
		  
	        String[] checkboxNames = {"sunroof", "panoramicsunroof", "aluminumwheels", "powersidemirror", "hidlamps", "adaptiveheadlamps", "ledrearlamps", "daytimelights", "highbeamassist", "compressiondoor", "automaticslidingdoor", "powersidestep", "roofrack"};
	        for (String checkboxName : checkboxNames) {
	            if (request.getParameter(checkboxName) != null) {
	                switch (checkboxName) {
	                case "sunroof":
	                	exterior.setSunroof(true);
	                	break;
	                	case "panoramicsunroof":
	                	exterior.setPanoramicsunroof(true);
	                	break;
	                	case "aluminumwheels":
	                	exterior.setAluminumwheels(true);
	                	break;
	                	case "powersidemirror":
	                	exterior.setPowersidemirror(true);
	                	break;
	                	case "hidlamps":
	                	exterior.setHidlamps(true);
	                	break;
	                	case "adaptiveheadlamps":
	                	exterior.setAdaptiveheadlamps(true);
	                	break;
	                	case "ledrearlamps":
	                	exterior.setLedrearlamps(true);
	                	break;
	                	case "daytimelights":
	                	exterior.setDaytimelights(true);
	                	break;
	                	case "highbeamassist":
	                	exterior.setHighbeamassist(true);
	                	break;
	                	case "compressiondoor":
	                	exterior.setCompressiondoor(true);
	                	break;
	                	case "automaticslidingdoor":
	                	exterior.setAutomaticslidingdoor(true);
	                	break;
	                	case "powersidestep":
	                	exterior.setPowersidestep(true);
	                	break;
	                	case "roofrack":
	                	exterior.setRoofrack(true);
	                	break;
	                }
	                registService.insertEx(exterior);
	                exterior.setVehicleInformationEntity(savedVehicleInformation);

	            }
	        }
	        
	       
	        String[] checkboxNames2 = {"leatherseats", "powerseatdriver", "powerseatpassenger", "heatedseatfront", "heatedseatrear", "ventilatedseats", "memoryseats", "foldingseats", "massageseats", "walkinseat","lumbarsupport","highpassroommirror","ecmroommirror","rearseatvents","paddleshift","powersunshade","ambientlighting"};
	        for (String checkboxName2 : checkboxNames2) {
	            if (request.getParameter(checkboxName2) != null) {
	                switch (checkboxName2) {
	                    case "leatherseats":
	                        interior.setLeatherseats(true);
	                        break;
	                    case "powerseatdriver":
	                        interior.setPowerseatdriver(true);
	                        break;
	                    case "powerseatpassenger":
	                        interior.setPowerseatpassenger(true);
	                        break;
	                    case "heatedseatfront":
	                        interior.setHeatedseatfront(true);
	                        break;
	                    case "heatedseatrear":
	                        interior.setHeatedseatrear(true);
	                        break;
	                    case "ventilatedseats":
	                        interior.setVentilatedseats(true);
	                        break;
	                    case "memoryseats":
	                        interior.setMemoryseats(true);
	                        break;
	                    case "foldingseats":
	                        interior.setFoldingseats(true);
	                        break;
	                    case "massageseats":
	                        interior.setMassageseats(true);
	                        break;
	                    case "walkinseat":
	                        interior.setWalkinseat(true);
	                        break;
	                    case "lumbarsupport":
	                        interior.setLumbarsupport(true);
	                        break;
	                    case "highpassroommirror":
	                        interior.setHighpassroommirror(true);
	                        break;
	                    case "ecmroommirror":
	                        interior.setEcmroommirror(true);
	                        break;
	                    case "rearseatvents":
	                        interior.setRearseatvents(true);
	                        break;
	                    case "paddleshift":
	                        interior.setPaddleshift(true);
	                        break;
	                    case "powersunshade":
	                        interior.setPowersunshade(true);
	                        break;
	                    case "ambientlighting":
	                        interior.setAmbientlighting(true);
	                        break;
	                }
	                interior.setVehicleInformationEntity(savedVehicleInformation);
	                registService.insertIn(interior);
	            }
	        }

	        
	        
	        String[] checkboxNames3 = {"smartkey", "heatedsteeringwheel", "remotecontrolsteeringwheel", "automaticairconditioning", "dualzoneairconditioning", "autoheadlights", "cruisecontrol", "smartcruisecontrol", "stopandgo", "powertrunk", "smarttrunk", "electronicparkingbrake", "hillstartassist", "head-updisplay", "wirelesscharging", "automaticparking", "refrigerator", "headupdisplay"};

	        for (String checkboxName3 : checkboxNames3) {
	            if (request.getParameter(checkboxName3) != null) {
	                switch (checkboxName3) {
	                    case "smartkey":
	                        convenience.setSmartkey(true);
	                        break;
	                    case "heatedsteeringwheel":
	                        convenience.setHeatedsteeringwheel(true);
	                        break;
	                    case "remotecontrolsteeringwheel":
	                        convenience.setRemotecontrolsteeringwheel(true);
	                        break;
	                    case "automaticairconditioning":
	                        convenience.setAutomaticairconditioning(true);
	                        break;
	                    case "dualzoneairconditioning":
	                        convenience.setDualzoneairconditioning(true);
	                        break;
	                    case "autoheadlights":
	                        convenience.setAutoheadlights(true);
	                        break;
	                    case "cruisecontrol":
	                        convenience.setCruisecontrol(true);
	                        break;
	                    case "smartcruisecontrol":
	                        convenience.setSmartcruisecontrol(true);
	                        break;
	                    case "stopandgo":
	                        convenience.setStopandgo(true);
	                        break;
	                    case "powertrunk":
	                        convenience.setPowertrunk(true);
	                        break;
	                    case "smarttrunk":
	                        convenience.setSmarttrunk(true);
	                        break;
	                    case "electronicparkingbrake":
	                        convenience.setElectronicparkingbrake(true);
	                        break;
	                    case "hillstartassist":
	                        convenience.setHillstartassist(true);
	                        break;
	                    case "head-updisplay":
	                        convenience.setHeadupdisplay(true);
	                        break;
	                    case "wirelesscharging":
	                        convenience.setWirelesscharging(true);
	                        break;
	                    case "automaticparking":
	                        convenience.setAutomaticparking(true);
	                        break;
	                    case "refrigerator":
	                        convenience.setRefrigerator(true);
	                        break;
	                }
	                convenience.setVehicleInformationEntity(savedVehicleInformation);
	                registService.insertCv(convenience);
	            }
	        }

	        
	        String[] checkboxNames4 = {"curtainairbags", "kneeairbags", "passengerairbags", "abs", "esc", "rearsensors", "frontsensors", "rearcamera", "frontcamera", "aroundview", "tpms", "ldws", "aeb", "ecs", "rearcrosstrafficalert", "tcs"};
	        for (String checkboxName4 : checkboxNames4) {
	          if (request.getParameter(checkboxName4) != null) {
	            switch (checkboxName4) {
	              case "curtainairbags":
	                safety.setCurtainairbags(true);
	                break;
	              case "kneeairbags":
	                safety.setKneeairbags(true);
	                break;
	              case "passengerairbags":
	                safety.setPassengerairbags(true);
	                break;
	              case "abs":
	                safety.setAbs(true);
	                break;
	              case "esc":
	                safety.setEsc(true);
	                break;
	              case "rearsensors":
	                safety.setRearsensors(true);
	                break;
	              case "frontsensors":
	                safety.setFrontsensors(true);
	                break;
	              case "rearcamera":
	                safety.setRearcamera(true);
	                break;
	              case "frontcamera":
	                safety.setFrontcamera(true);
	                break;
	              case "aroundview":
	                safety.setAroundview(true);
	                break;
	              case "tpms":
	                safety.setTpms(true);
	                break;
	              case "ldws":
	                safety.setLdws(true);
	                break;
	              case "aeb":
	                safety.setAeb(true);
	                break;
	              case "ecs":
	                safety.setEcs(true);
	                break;
	              case "rearcrosstrafficalert":
	                safety.setRearcrosstrafficalert(true);
	                break;
	              case "tcs":
	                safety.setTcs(true);
	                break;
	            }
	            safety.setVehicleInformationEntity(savedVehicleInformation);
	            registService.insertSf(safety);
	          }
	        }

	        
	        
	        String[] checkboxNames5 = {"aftermarketnavigation", "usb", "aux", "bluetooth", "mp3", "dmb", "cdplayer", "avsystem", "rearseattv", "telematics", "smartphonemirroring"};
	        for (String checkboxName5 : checkboxNames5) {
	          if (request.getParameter(checkboxName5) != null) {
	            switch (checkboxName5) {
	              case "aftermarketnavigation":
	                multimedia.setAftermarketnavigation(true);
	                break;
	              case "usb":
	                multimedia.setUsb(true);
	                break;
	              case "aux":
	                multimedia.setAux(true);
	                break;
	              case "bluetooth":
	                multimedia.setBluetooth(true);
	                break;
	              case "mp3":
	                multimedia.setMp3(true);
	                break;
	              case "dmb":
	                multimedia.setDmb(true);
	                break;
	              case "cdplayer":
	                multimedia.setCdplayer(true);
	                break;
	              case "avsystem":
	                multimedia.setAvsystem(true);
	                break;
	              case "rearseattv":
	                multimedia.setRearseattv(true);
	                break;
	              case "telematics":
	                multimedia.setTelematics(true);
	                break;
	              case "smartphonemirroring":
	                multimedia.setSmartphonemirroring(true);
	                break;
	            }
	            multimedia.setVehicleInformationEntity(savedVehicleInformation);
	            registService.insertMu(multimedia);
	          }
	        }

	        //board 테이블 저장 코드
	        String usernickname = (String) httpSession.getAttribute("nickname");
			Board board = new Board();
			board.setNickname(usernickname);
			board.setViews(0);
			board.setVehicleInformation(savedVehicleInformation);
			board.setIsdelete(0);
			board.setTransactionDate(new Date(System.currentTimeMillis()));
			board.setTransactionLocation("개마고원");
			board.setRegistrationDate(new Date(System.currentTimeMillis()));
			registService.savetheboard(board);
			
			
			
			model.addAttribute("success", true);
			return "regist";
		} catch (Exception e) {
			model.addAttribute("error", e.getMessage());		//console 창이 아닌 페이지에 error메시지 표시 가능
			return "error";	//실패시 접속페이지 생각해 놓기
		}
		
	}
	private void saveFile(MultipartFile file, String vehicleNo, String name) throws IOException {
		String folderPath = "C:/eGovFrameDev-4.0.0-64bit/project_Workspace/CarinaProject/src/main/resources/static/img/cars/" + vehicleNo + "/";
	    File folder = new File(folderPath);
	    if (!folder.exists()) {
	        boolean created = folder.mkdirs(); // Create the directory if it doesn't exist
	        if (!created) {
	            throw new IOException("Failed to create directory: " + folderPath);
	        }
	    }
	    String extension = FilenameUtils.getExtension(file.getOriginalFilename());
	    String fileName = name + "." + extension;
	    File dest = new File(folderPath + fileName);
	    file.transferTo(dest);
	    if (!dest.setExecutable(true) || !dest.setReadable(true) || !dest.setWritable(true)) {
	        throw new IOException("Failed to set file permissions: " + dest.getAbsolutePath());
	    } 
	}
}