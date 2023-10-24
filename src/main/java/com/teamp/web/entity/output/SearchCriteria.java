package com.teamp.web.entity.output;

import org.springframework.data.jpa.domain.Specification;

import com.teamp.web.entity.input.Board;
import com.teamp.web.entity.output.*;


public class SearchCriteria {
    public static Specification<SearchPageView> type(String request) {
        return (root, query, builder) -> builder.equal(root.get("vehicletype"), request);
    }
    
    public static Specification<SearchPageView> fuel(String request) {
        return (root, query, builder) -> builder.equal(root.get("fueltype"), request);
    }
    
    public static Specification<SearchPageView> mission(String request) {
        return (root, query, builder) -> builder.equal(root.get("transmissiontype"), request);
    }
    
    public static Specification<SearchPageView> wheeldrt(String request) {
        return (root, query, builder) -> builder.equal(root.get("wheeltype"), request);
    }
    
    public static Specification<SearchPageView> psngcap(String request) {
        return (root, query, builder) -> builder.equal(root.get("passengercapacity"), request);
    }
    
    public static Specification<SearchPageView> cc(String request) {
        return (root, query, builder) -> builder.lessThan(root.get("displacement"), request);
    }

	public static Specification<SearchPageView> greatercc(String request) {
		
		return (root, query, builder) -> builder.greaterThan(root.get("displacement"), request);
	}

	public static Specification<SearchPageView> model(String request) {
		
		return (root, query, builder) -> builder.like(root.get("modelname"), "%" + request + "%");
	}

	public static Specification<SearchPageView> maker(String request) {
		
		return (root, query, builder) -> builder.equal(root.get("manufacturer"), request);
	}

	public static Specification<SearchPageView> betweenyear(String priyear, String afteryear) {
		// TODO Auto-generated method stub
		return (root, query, builder) -> builder.between(root.get("year"), priyear , afteryear);
	}

	public static Specification<SearchPageView> betweendistace(String pridistance, String afterdistance) {
		// TODO Auto-generated method stub
		return (root, query, builder) -> builder.between(root.get("mileage"), Integer.parseInt(pridistance) , Integer.parseInt(afterdistance));
	}

	public static Specification<Board> isdelete(int i) {
		// TODO Auto-generated method stub
		return (root, query, builder) -> builder.equal(root.get("isdelete"), i);
	}
	
	public static Specification<SearchPageView> ckdelete(int i) {
		// TODO Auto-generated method stub
		return (root, query, builder) -> builder.equal(root.get("isdelete"), i);
	}
    

}