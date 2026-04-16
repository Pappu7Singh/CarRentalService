package com.CarRentalService.controller;

import java.io.IOException;

import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;

import com.CarRentalService.model.Booking;
import com.CarRentalService.service.BookingService;
import com.CarRentalService.service.CarService;

@WebServlet("/cancel-booking")
public class CancelBookingServlet extends HttpServlet {

	protected void doGet(HttpServletRequest req, HttpServletResponse res)
	        throws IOException {

	    int id = Integer.parseInt(req.getParameter("id"));

	    BookingService service = new BookingService();
	    service.cancelBooking(id);

	    // GET CAR ID FROM DB
	    BookingService bs = new BookingService();
	    Booking b = bs.getBookingById(id);

	    //  make car available again
	    CarService cs = new CarService();
	    cs.updateAvailability(b.getCarId(), true);

	    res.sendRedirect("my-bookings");
	}    
}