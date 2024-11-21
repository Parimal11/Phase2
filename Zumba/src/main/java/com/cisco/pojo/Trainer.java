package com.cisco.pojo;


public class Trainer {
    private int trainerId;
    private String name;
    private String slotDate;
    private String slotTime;
    private int maxSlots;

    // Getters and Setters
    public int getTrainerId() {
        return trainerId;
    }

    public void setTrainerId(int trainerId) {
        this.trainerId = trainerId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getSlotDate() {
        return slotDate;
    }

    public void setSlotDate(String slotDate) {
        this.slotDate = slotDate;
    }

    public String getSlotTime() {
        return slotTime;
    }

    public void setSlotTime(String slotTime) {
        this.slotTime = slotTime;
    }

    public int getMaxSlots() {
        return maxSlots;
    }

    public void setMaxSlots(int maxSlots) {
        this.maxSlots = maxSlots;
    }

    public Trainer(String name, String slotDate, String slotTime, int maxSlots) {
        this.name = name;
        this.slotDate = slotDate;
        this.slotTime = slotTime;
        this.maxSlots = maxSlots;
    }

	public Trainer() {
		super();
		// TODO Auto-generated constructor stub
	}
    
    
}
