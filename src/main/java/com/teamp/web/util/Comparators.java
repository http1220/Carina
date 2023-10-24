package com.teamp.web.util;

import java.util.Comparator;

import com.teamp.web.entity.output.SearchPageView;

public class Comparators {

	public String sayhi(int i) {

		return "hihi";

	}

	public Comparator<SearchPageView> att_drt(String att, String drt) {
		// drt : ASC or DESC
		// att : 주행거리 , 연식 , 가격

		if (att.equals("price")) {
			Comparator<SearchPageView> by = new Comparator<SearchPageView>() {
				@Override
				public int compare(SearchPageView p1, SearchPageView p2) {
					if (drt.equals("ASC")) {
						return p1.getPrice() - p2.getPrice();
					} else {
						return p2.getPrice() - p1.getPrice();
					}
				};
			};
			return by;
		}

		else if (att.equals("year")) {
			Comparator<SearchPageView> by = new Comparator<SearchPageView>() {
				@Override
				public int compare(SearchPageView y1, SearchPageView y2) {
					if (drt.equals("ASC")) {
						return Integer.parseInt(y1.getYear()) - Integer.parseInt(y2.getYear());
					} else {
						return Integer.parseInt(y2.getYear()) - Integer.parseInt(y1.getYear());
					}

				};
			};
			return by;
		}

		else if (att.equals("mileage")) {
			Comparator<SearchPageView> by = new Comparator<SearchPageView>() {
				@Override
				public int compare(SearchPageView m1, SearchPageView m2) {
					if (drt.equals("ASC")) {
						return m1.getMileage() - m2.getMileage();
					} else {
						return m2.getMileage() - m1.getMileage();
					}

				};
			};
			return by;
		}
		return null;

	}
}

// TODO Auto-generated method stub
//					int m1 = o1.getMileage(); mileage
//					int m2 = o2.getMileage();
//					int p1 = o1.getPrice();
//					int p2 = o2.getPrice();
//					int y1 = Integer.parseInt(o1.getYear());
//					int y2 = Integer.parseInt(o2.getYear());