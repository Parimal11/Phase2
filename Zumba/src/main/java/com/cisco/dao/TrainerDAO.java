package com.cisco.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import com.cisco.dbutil.DbUtil;
import com.cisco.pojo.Trainer;

public class TrainerDAO {
	
    
    // Method to add a trainer and return success status
    public boolean addTrainer(Trainer trainer) {
        boolean success = false; // Initialize success flag
        try (Connection con = DbUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("INSERT INTO trainer (name, slot_date, slot_time, max_slots) VALUES (?, ?, ?, ?)")) {
            ps.setString(1, trainer.getName());
            ps.setString(2, trainer.getSlotDate());
            ps.setString(3, trainer.getSlotTime());
            ps.setInt(4, trainer.getMaxSlots());
            ps.executeUpdate();
            success = true; // Set to true if insertion is successful
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return success; // Return the success status
    }

    // Method to retrieve all trainers
    public List<Trainer> getAllTrainers() {
        List<Trainer> trainers = new ArrayList<>();
        try (Connection con = DbUtil.getConnection();
             Statement stmt = con.createStatement();
             ResultSet rs = stmt.executeQuery("SELECT * FROM trainer")) {
            while (rs.next()) {
                Trainer trainer = new Trainer();
                trainer.setTrainerId(rs.getInt("trainer_id"));
                trainer.setName(rs.getString("name"));
                trainer.setSlotDate(rs.getString("slot_date"));
                trainer.setSlotTime(rs.getString("slot_time"));
                trainer.setMaxSlots(rs.getInt("max_slots"));
                trainers.add(trainer);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return trainers;
    }

    // Method to delete a trainer by ID
    public void deleteTrainer(int trainerId) {
        try (Connection con = DbUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("DELETE FROM trainer WHERE trainer_id=?")) {
            ps.setInt(1, trainerId);
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    // Method to retrieve a trainer by ID
    public Trainer getTrainerById(int trainerId) {
        Trainer trainer = null;
        try (Connection con = DbUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT * FROM trainer WHERE trainer_id=?")) {
            ps.setInt(1, trainerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                trainer = new Trainer();
                trainer.setTrainerId(rs.getInt("trainer_id"));
                trainer.setName(rs.getString("name"));
                trainer.setSlotDate(rs.getString("slot_date"));
                trainer.setSlotTime(rs.getString("slot_time"));
                trainer.setMaxSlots(rs.getInt("max_slots"));
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return trainer;
    }

    // Method to update a trainer's details
    public void updateTrainer(Trainer trainer) {
        try (Connection con = DbUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("UPDATE trainer SET name=?, slot_date=?, slot_time=?, max_slots=? WHERE trainer_id=?")) {
            ps.setString(1, trainer.getName());
            ps.setString(2, trainer.getSlotDate());
            ps.setString(3, trainer.getSlotTime());
            ps.setInt(4, trainer.getMaxSlots());
            ps.setInt(5, trainer.getTrainerId());
            ps.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    
    public String getTrainerNameById(int trainerId) {
        String trainerName = null;
        try (Connection con = DbUtil.getConnection();
             PreparedStatement ps = con.prepareStatement("SELECT name FROM trainer WHERE trainer_id = ?")) {
            ps.setInt(1, trainerId);
            ResultSet rs = ps.executeQuery();
            if (rs.next()) {
                trainerName = rs.getString("name");
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return trainerName;
    }
    
    

}
