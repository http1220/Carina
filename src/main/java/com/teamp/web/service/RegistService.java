package com.teamp.web.service;


import org.springframework.stereotype.Service;

import com.teamp.web.dao.ConvenienceRepository;
import com.teamp.web.dao.ExteriorRepository;
import com.teamp.web.dao.InteriorRepository;
import com.teamp.web.dao.MultimediaRepository;
import com.teamp.web.dao.PhotoRepository;
import com.teamp.web.dao.SafetyRepository;
import com.teamp.web.dao.VehicleInformationRepository;
import com.teamp.web.entity.ConvenienceEntity;
import com.teamp.web.entity.ExteriorEntity;
import com.teamp.web.entity.InteriorEntity;
import com.teamp.web.entity.MultimediaEntity;
import com.teamp.web.entity.PhotoEntity;
import com.teamp.web.entity.SafetyEntity;
import com.teamp.web.entity.VehicleInformationEntity;
import com.teamp.web.entity.input.Board;
import com.teamp.web.repository.BoardRepository;

import lombok.RequiredArgsConstructor;

@Service
@RequiredArgsConstructor
public class RegistService {

	private final VehicleInformationRepository vehicleInformationRepository;
	private final ConvenienceRepository convenienceRepository;
	private final ExteriorRepository exteriorRepository;
	private final InteriorRepository interiorRepository;
	private final MultimediaRepository multimediaRepository;
	private final PhotoRepository photoRepository;
	private final SafetyRepository safetyRepository;
	private final BoardRepository boardRepository;
	

	public VehicleInformationEntity insertVi(VehicleInformationEntity vehicleInformation) {
	    return vehicleInformationRepository.save(vehicleInformation);
	    
	}

	public void insertPo(PhotoEntity photo) {
		photoRepository.save(photo);
	}

    
    public void insertCv(ConvenienceEntity convenience) {
        // Set checkbox values to boolean
        convenience.setSmartkey(convenience.isSmartkey());
        convenience.setHeatedsteeringwheel(convenience.isHeatedsteeringwheel());
        convenience.setRemotecontrolsteeringwheel(convenience.isRemotecontrolsteeringwheel());
        convenience.setAutomaticairconditioning(convenience.isAutomaticairconditioning());
        convenience.setDualzoneairconditioning(convenience.isDualzoneairconditioning());
        convenience.setAutoheadlights(convenience.isAutoheadlights());
        convenience.setCruisecontrol(convenience.isCruisecontrol());
        convenience.setSmartcruisecontrol(convenience.isSmartcruisecontrol());
        convenience.setStopandgo(convenience.isStopandgo());
        convenience.setPowertrunk(convenience.isPowertrunk());
        convenience.setSmarttrunk(convenience.isSmarttrunk());
        convenience.setElectronicparkingbrake(convenience.isElectronicparkingbrake());
        convenience.setHillstartassist(convenience.isHillstartassist());
        convenience.setHeadupdisplay(convenience.isHeadupdisplay());
        convenience.setWirelesscharging(convenience.isWirelesscharging());
        convenience.setAutomaticparking(convenience.isAutomaticparking());
        convenience.setRefrigerator(convenience.isRefrigerator());
        convenience.setHeadupdisplay(convenience.isHeadupdisplay());

        // Save to database
        convenienceRepository.save(convenience);
    }

    
    public void insertEx(ExteriorEntity exterior) {
        // Convert checkbox values to boolean
        exterior.setSunroof(exterior.isSunroof());
        exterior.setPanoramicsunroof(exterior.isPanoramicsunroof());
        exterior.setAluminumwheels(exterior.isAluminumwheels());
        exterior.setPowersidemirror(exterior.isPowersidemirror());
        exterior.setHidlamps(exterior.isHidlamps());
        exterior.setLedheadlamps(exterior.isLedheadlamps());
        exterior.setAdaptiveheadlamps(exterior.isAdaptiveheadlamps());
        exterior.setLedrearlamps(exterior.isLedrearlamps());
        exterior.setDaytimelights(exterior.isDaytimelights());
        exterior.setHighbeamassist(exterior.isHighbeamassist());
        exterior.setCompressiondoor(exterior.isCompressiondoor());
        exterior.setAutomaticslidingdoor(exterior.isAutomaticslidingdoor());
        exterior.setPowersidestep(exterior.isPowersidestep());
        exterior.setRoofrack(exterior.isRoofrack());
        
        // Save to database
        exteriorRepository.save(exterior);
    }

    public void insertIn(InteriorEntity interior) {
        // Convert checkbox values to boolean
    	interior.setLeatherseats(interior.isLeatherseats());
    	interior.setPowerseatdriver(interior.isPowerseatdriver());
    	interior.setPowerseatpassenger(interior.isPowerseatpassenger());
    	interior.setHeatedseatfront(interior.isHeatedseatfront());
    	interior.setHeatedseatrear(interior.isHeatedseatrear());
    	interior.setVentilatedseats(interior.isVentilatedseats());
    	interior.setMemoryseats(interior.isMemoryseats());
    	interior.setFoldingseats(interior.isFoldingseats());
    	interior.setMassageseats(interior.isMassageseats());
    	interior.setWalkinseat(interior.isWalkinseat());
    	interior.setLumbarsupport(interior.isLumbarsupport());
    	interior.setHighpassroommirror(interior.isHighpassroommirror());
    	interior.setEcmroommirror(interior.isEcmroommirror());
    	interior.setRearseatvents(interior.isRearseatvents());
    	interior.setPaddleshift(interior.isPaddleshift());
    	interior.setPowersunshade(interior.isPowersunshade());
    	interior.setAmbientlighting(interior.isAmbientlighting());

        // Save to database
        interiorRepository.save(interior);
    }

    public void insertMu(MultimediaEntity multimedia) {
        // Set checkbox values to boolean
        multimedia.setGenuinenavigation(multimedia.isGenuinenavigation());
        multimedia.setAftermarketnavigation(multimedia.isAftermarketnavigation());
        multimedia.setUsb(multimedia.isUsb());
        multimedia.setAux(multimedia.isAux());
        multimedia.setBluetooth(multimedia.isBluetooth());
        multimedia.setMp3(multimedia.isMp3());
        multimedia.setDmb(multimedia.isDmb());
        multimedia.setCdplayer(multimedia.isCdplayer());
        multimedia.setAvsystem(multimedia.isAvsystem());
        multimedia.setRearseattv(multimedia.isRearseattv());
        multimedia.setTelematics(multimedia.isTelematics());
        multimedia.setSmartphonemirroring(multimedia.isSmartphonemirroring());

        // Save to database
        multimediaRepository.save(multimedia);
    }

    public void insertSf(SafetyEntity safety) {
        // Set checkbox values to boolean
        safety.setCurtainairbags(safety.isCurtainairbags());
        safety.setKneeairbags(safety.isKneeairbags());
        safety.setPassengerairbags(safety.isPassengerairbags());
        safety.setAbs(safety.isAbs());
        safety.setEsc(safety.isEsc());
        safety.setRearsensors(safety.isRearsensors());
        safety.setFrontsensors(safety.isFrontsensors());
        safety.setRearcamera(safety.isRearcamera());
        safety.setFrontcamera(safety.isFrontcamera());
        safety.setAroundview(safety.isAroundview());
        safety.setTpms(safety.isTpms());
        safety.setLdws(safety.isLdws());
        safety.setAeb(safety.isAeb());
        safety.setEcs(safety.isEcs());
        safety.setRearcrosstrafficalert(safety.isRearcrosstrafficalert());
        safety.setTcs(safety.isTcs());

        // Save to database
        safetyRepository.save(safety);
    }

	public void savetheboard(Board board) {
		boardRepository.save(board);
		
	}

	

	

    
    
    
    
    
    
    
    
}





