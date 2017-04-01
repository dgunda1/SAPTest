package com.sap.parkme.dao;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import com.sap.parkme.model.Parkme;
import com.sap.parkme.util.DbUtil;

public class ParkingDao {

	private Connection connection;

	public ParkingDao() {

		connection = DbUtil.getConnection();

	}

	public Object getAllUsers() {
		// TODO Auto-generated method stub
		return null;
	}

	public void ParkCar(Parkme park) {
		// TODO Auto-generated method stub
		try {

			PreparedStatement preparedStatement = connection

					.prepareStatement("insert into parkme(parkingNumber,carNumber,TypeId,inTime) values (?, ?, ?, ? )");

			// Parameters start with 1

			preparedStatement.setInt(1, park.getParkingNumber());

			preparedStatement.setInt(2, park.getCarNumber());

			preparedStatement.setInt(3, park.getTypeId());

			preparedStatement.setString(4, park.getInTime());

			preparedStatement.executeUpdate();

		} catch (SQLException e) {

			e.printStackTrace();

		}

	}

	public void checkOutCar(Parkme park) {
		// TODO Auto-generated method stub

		park.setPrice(CalculatePrice(park)); 
		
		PreparedStatement preparedStatement;
		try {
			// preparedStatement =
			// connection.prepareStatement("update parkme set outTime=?, Price=?"
			// +
			// "where parkingNumber=?");
			preparedStatement = connection
					.prepareStatement("insert into parkmehistory(parkingNumber,carNumber,TypeId,inTime,outTime,Price) values (?, ?, ?, ?,?,? )");

			// Parameters start with 1
			preparedStatement.setInt(1, park.getParkingNumber());

			preparedStatement.setInt(2, park.getCarNumber());

			preparedStatement.setInt(3, park.getTypeId());

			preparedStatement.setString(4, park.getInTime());
			preparedStatement.setString(5, park.getOutTime());
			preparedStatement.setString(6, park.getPrice());

			int count = preparedStatement.executeUpdate();
			if (count > 0) {
				preparedStatement = connection
						.prepareStatement("DELETE FROM parkme WHERE parkingNumber = ?");
				preparedStatement.setInt(1, park.getParkingNumber());
				 preparedStatement.executeUpdate();
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

	}



	private String CalculatePrice(Parkme park) {
		// TODO Auto-generated method stub
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("SELECT t1.intime,t2.PricePerHr,t1.TypeId FROM parkme as t1 inner join slottype as t2 on t1.TypeId=t2.Id where t1.parkingNumber = ?");

			preparedStatement.setInt(1, park.getParkingNumber());

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				String intime = rs.getString("intime");
				String perHrPrice = rs.getString("PricePerHr");
				int typeID = rs.getInt("TypeId");
				park.setInTime(intime);
				park.setTypeId(typeID);
				
				String dateStart = intime;
				String dateStop = park.getOutTime();

				// Custom date format
				SimpleDateFormat format = new SimpleDateFormat(
						"yyyy-MM-dd HH:mm:ss");

				Date d1 = null;
				Date d2 = null;

				try {
					d1 = format.parse(dateStart);
					d2 = format.parse(dateStop);
				} catch (ParseException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}

				long diff = d2.getTime() - d1.getTime();

				long diffHours = diff / (60 * 60 * 1000);

				return ((int) (diffHours)) * (Integer.parseInt(perHrPrice))
						+ "";
			}

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return null;
	}

	public boolean validateCheckIn(Parkme park) {
		// TODO Auto-generated method stub

		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("SELECT "+
       "CASE WHEN (SELECT count(TypeId) as count FROM parkme group by TypeId  having TypeId =? )<(select SpceCapacity from slottype where Id =?)"+
       "THEN 1 "+
       "ELSE 0 "+
       "END AS RowCountResult");

			preparedStatement.setInt(1, park.getTypeId());
			preparedStatement.setInt(2, park.getTypeId());

			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int count = Integer.parseInt(rs.getString("RowCountResult")); 
				if(count==0){
					park.setErrorMsg("Parking not available");
					return false;
				}
			}
			
			preparedStatement = connection
					.prepareStatement("SELECT parkingNumber FROM parkme where carNumber =?");

			preparedStatement.setInt(1, park.getCarNumber());  
			ResultSet rs1 = preparedStatement.executeQuery();

			while (rs1.next()) {
				String intime =rs1.getString("parkingNumber"); 
				 
					park.setErrorMsg("Car Already Parked with parking ID:"+intime);
					return false;
			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return true;
	}

	public boolean validatecheckOut(Parkme park) {
		// TODO Auto-generated method stub
		try {
			PreparedStatement preparedStatement = connection
					.prepareStatement("SELECT count(carNumber) as count FROM parkme where carNumber =? and parkingNumber=?");
			
			preparedStatement.setInt(1, park.getCarNumber());

			preparedStatement.setInt(2, park.getParkingNumber());
			
			ResultSet rs = preparedStatement.executeQuery();

			while (rs.next()) {
				int count = Integer.parseInt(rs.getString("count"));
				if(count < 1)
				{
					park.setErrorMsg("Car "+park.getCarNumber()+" assosiated with "+park.getParkingNumber()+" is not exist");
					return false;
				}

			}
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return true;
	}

}
