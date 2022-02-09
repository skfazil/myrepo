package com.cushina.service;

import java.util.Date;
import java.util.List;

import com.cushina.common.dto.AvailabilityByDateDTO;
import com.cushina.web.bean.BookingHistoryBean;

public interface ReservationService {

	public boolean isSave(BookingHistoryBean bean);

	public AvailabilityByDateDTO reserveSelectedRoom(Long id);

	public List<AvailabilityByDateDTO> getAvailDatesToReserveRoom(Long hotelId,
			Date selectedDt, Long roomNum);

	public Long deleteReservation(Long bookingID);

	public boolean isChangeReservaion(Long bookingID);

	public Long cancelReservation(Long bookingID);

	public boolean isReservationProgress(Long hotelID, Long categoryId,
			Long roomId, String checkedInDt, String checkedoutdate);
	
	public Long sameHotelReservtn(Long bookingID);

}
