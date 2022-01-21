package com.stadiumbooking.model;

import java.util.Objects;

public class Wallet_details {

	private int walletId;
	private int userId;
	private Long amount;
	public Wallet_details() {
		super();
		// TODO Auto-generated constructor stub
	}
	public Wallet_details(int userId, Long amount) {
		super();
		this.userId = userId;
		this.amount = amount;
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
		return "Wallet_details [walletId=" + walletId + ", userId=" + userId + ", amount=" + amount + "]";
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
		Wallet_details other = (Wallet_details) obj;
		return Objects.equals(amount, other.amount) && userId == other.userId && walletId == other.walletId;
	}
	
	
}
