package repository;

import model.Patient;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class PatientRepository extends JdbcRepository {
    public PatientRepository() {
        getConnection();
    }

    public List<Patient> getAllPatients() {
        List<Patient> patientList = new ArrayList<>();

        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM public.patients")) {

            while (resultSet.next()) {
                int id = resultSet.getInt("patient_id");
                String name = resultSet.getString("patient_name");
                String email = resultSet.getString("patient_email");

                Patient patient = new Patient();
                patient.setId(id);
                patient.setName(name);
                patient.setEmail(email);

                patientList.add(patient);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return patientList;
    }

    public void addPatient(Patient patient) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("INSERT INTO public.patients(patient_name, patient_email) VALUES (?, ?)")) {
            statement.setString(1, patient.getName());
            statement.setString(2, patient.getEmail());
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deletePatient(int id) {

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("DELETE FROM public.patients WHERE patient_id = ?")) {
            statement.setInt(1, id);
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Patient> selectPatient(int id) {
        List<Patient> patientList2 = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM public.patients WHERE patient_id = ?")) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {

                int resultId = resultSet.getInt("patient_id");
                String name = resultSet.getString("patient_name");
                String email = resultSet.getString("patient_email");

                Patient patient = new Patient();
                patient.setId(resultId);
                patient.setName(name);
                patient.setEmail(email);

                patientList2.add(patient);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return patientList2;
    }

        public void updatePatient (Patient patient){
            try (Connection connection = getConnection();
                 PreparedStatement statement = connection.prepareStatement("UPDATE public.patients SET patient_name = ? , patient_email = ? WHERE patient_id = ?")) {
                statement.setString(1, patient.getName());
                statement.setString(2, patient.getEmail());
                statement.setInt(3, patient.getId());
                statement.executeUpdate();
            } catch (SQLException e) {
                e.printStackTrace();
            }
        }

    }
