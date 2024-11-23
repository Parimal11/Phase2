<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Add Trainer</title>
    <link rel="stylesheet" href="styles.css" />
</head>
<body>
    <div class="container">
        <h2>Add New Trainer</h2>
        <form action="add_trainer_process.jsp" method="post">
            Name: <input type="text" name="name" required><br>
            Slot Date: <input type="date" name="slot_date" required><br>
            Slot Time: <input type="time" name="slot_time" required><br>
            Max Slots: <input type="number" name="max_slots" required><br>
            Trainer Email: <input type="email" name="trainer_email" required><br> <!-- New email field -->
            <input type="submit" value="Add Trainer">
        </form>
    </div>
</body>
</html>