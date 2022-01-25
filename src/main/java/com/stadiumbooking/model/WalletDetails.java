package com.stadiumbooking.model;

import java.time.LocalDateTime;
import java.util.Objects;

public class WalletDetails {

	private int walletId;
	private int userId;
	private Long amount;
	private LocalDateTime transaction_date;
	
	public WalletDetails() {
		super();
		// TODO Auto-generated constructor stub
	}
	

	public WalletDetails(int walletId, int userId, Long amount, LocalDateTime transaction_Date) {
		super();
		this.walletId = walletId;
		this.userId = userId;
		this.amount = amount;
		this.transaction_date= transaction_Date;
	}


	
	
	public LocalDateTime getTransaction_date() {
		return transaction_date;
	}


	public void setTransaction_date(LocalDateTime transaction_date) {
		this.transaction_date = transaction_date;
	}


	public int getWalletId() {
		return walletId;
	}
	public void setWalletId(int walletId) {
		this.walletId = walletId;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	
	
	
		@Override
	public String toString() {
		return "WalletDetails [walletId=" + walletId + ", userId=" + userId + ", amount=" + amount
				+ ", transaction_date=" + transaction_date + "]";
	}


		@Override
	public int hashCode() {
		return Objects.hash(amount, userId, walletId);
	}
	@Override
	public boolean equals(Object obj) {
		if (this == obj)
			return true;
		if (obj == null)
			return false;
		if (getClass() != obj.getClass())
			return false;
		WalletDetails other = (WalletDetails) obj;
		return Objects.equals(amount, other.amount) && userId == other.userId && walletId == other.walletId;
	}
	
	
}
