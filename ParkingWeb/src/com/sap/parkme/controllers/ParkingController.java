package com.sap.parkme.controllers;

import java.io.IOException;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Random;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.sap.parkme.dao.ParkingDao;
import com.sap.parkme.model.Parkme;


import sun.text.normalizer.ICUBinary.Authenticate;

public class ParkingController extends HttpServlet {

	private static String PARK_IN = "/index.jsp";

	private static String CHECK_OUT = "/checkOut.jsp";

	private ParkingDao dao;

	public ParkingController() {

		super();

		dao = new ParkingDao();

	}

	protected void doPost(HttpServletRequest request,
			HttpServletResponse response) throws ServletException, IOException {
		String forward = "";
		try {

			Parkme park = new Parkme();
			String action = request.getParameter("action");

			if (action.equals("parkIN")) {

				park.setCarNumber(Integer.parseInt(request
						.getParameter("carNumber")));
				park.setTypeId(Integer.parseInt(request.getParameter("type")));
				park.setParkingNumber(genParkingNumber(park.getCarNumber()));
				 DateFormat dateFormat = new
				 SimpleDateFormat("yyyy/MM/dd HH:mm:ss");
				Date intime = new Date();
				park.setInTime(dateFormat.format(intime));
				
				if(dao.validateCheckIn(park))
				dao.ParkCar(park);

				forward = PARK_IN;
				 
				request.setAttribute("park", park);

			} else if (action.equals("cehckOut")) {

				park.setCarNumber(Integer.parseInt(request
						.getParameter("carNumber")));
				park.setParkingNumber(Integer.parseInt(request
						.getParameter("parkingNumber")));
				 DateFormat dateFormat = new
				 SimpleDateFormat("yyyy-MM-dd HH:mm:ss");
				Date intime = new Date();
				park.setOutTime(dateFormat.format(intime));
				
				if(dao.validatecheckOut(park))				
				dao.checkOutCar(park);
				
				
				forward = CHECK_OUT;
				request.setAttribute("park", park);

			} else {

			}

		} catch (Exception e) {

			e.printStackTrace();

		}

		RequestDispatcher view = request.getRequestDispatcher(forward);

		view.forward(request, response);

	}

	private int genParkingNumber(int carNumber) {
		// TODO Auto-generated method stub
		Random r = new Random(System.currentTimeMillis());
		return ((1 + r.nextInt(2)) * 10000 + r.nextInt(10000));

	}

}