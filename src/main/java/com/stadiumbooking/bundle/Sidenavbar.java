package com.stadiumbooking.bundle;

import java.util.ListResourceBundle;

public class Sidenavbar extends ListResourceBundle {
	 public Object[][] getContents() {  
	        return contents;  
	    }  

	 static final Object[][] contents = { 
			 { "nav.Profile", "Profile" },  
	            { "nav.LogOut", "Logout" },
	            { "nav.MatchDetails", "Add Match" },
	            { "nav.StadiumDetails", "Stadium Details" },
	            { "nav.SportsDetails", "Sports Details" },
	            { "nav.AllUser", "Users List" },
	            { "nav.AllMatchDetails", "All Match Details" },
	            { "nav.AllBookingDetails", "Booking Details" },
	            { "nav.AllUserWalletList", "Transaction Historys" },
	            { "nav.StadiumList", "Stadium List" },
	            { "nav.RatingList", "Rating List" },
	            { "nav.UpcomingMatch", "Upcoming Matches" },
	            { "nav.MyMatch", "My Bookings" },
	            { "nav.Wallet", "Wallet" },
	            { "nav.Invite", "Invite" }
			 
	            };  
	}  

