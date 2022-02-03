package com.stadiumbooking.model;

import java.time.LocalDateTime;
import java.util.Objects;

public class WalletDetails {

	private int walletId;
	private User user;
	private Long amount;
	private LocalDateTime transactionDate;
	
	public WalletDetails() {
		super();
		
	}
	
	public WalletDetails(int walletId, User user, Long amount, LocalDateTime transactionDate) {
		super();
		this.walletId = walletId;
		this.user = user;
		this.amount = amount;
		this.transactionDate= transactionDate;
	}


	
	
	public LocalDateTime getTransactionDate() {
		return transactionDate;
	}


	public void setTransactionDate(LocalDateTime transactionDate) {
		this.transactionDate = transactionDate;
	}


	public int getWalletId() {
		return walletId;
	}
	public void setWalletId(int walletId) {
		this.walletId = walletId;
	}
	public User getUser() {
		return user;
	}
	public void setUser(User user) {
		this.user = user;
	}
	public Long getAmount() {
		return amount;
	}
	public void setAmount(Long amount) {
		this.amount = amount;
	}
	
	
	
		@Override
	public String toString() {
		return "WalletDetails [walletId=" + walletId + ", user=" + user + ", amount=" + amount
				+ ", transactionDate=" + transactionDate + "]";
	}


		@Override
	public int hashCode() {
		return Objects.hash(amount, user, walletId);
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
		return Objects.equals(amount, other.amount) && user == other.user && walletId == other.walletId;
	}
	
	
}
