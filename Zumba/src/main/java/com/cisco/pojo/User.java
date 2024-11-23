package com.cisco.pojo;

public class User {
    private int userId;
    private String name;
    private String phoneNumber;
    private String email;
    private String gender;
    private String trainerEmail; // New field for trainer ID

    // Getters and Setters
    public int getUserId() {
        return userId;
    }

    public void setUserId(int userId) {
        this.userId = userId;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getTrainerEmail() { // New getter for trainerEmail
        return trainerEmail;
    }
    public void setTrainerEmail(String trainerEmail) { // New setter for trainerEmail
        this.trainerEmail = trainerEmail;
    }


    public User() {
        super();
    }
}