package repository;

import model.Appointment;
import model.Patient;
import model.dto.CreateAppointmentDto;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class AppointmentRepository extends JdbcRepository {
    public AppointmentRepository() {
        getConnection();
    }

    public List<Appointment> getAllAppointments() {
        List<Appointment> appointmentList = new ArrayList<>();
        String sql = "SELECT public.appointments.appointment_id, public.appointments.patient_id, public.patients.patient_name, public.services.service_name, public.appointments.appointment_date From public.appointments INNER JOIN public.patients ON public.appointments.patient_id = public.patients.patient_id INNER JOIN public.services ON public.appointments.service_id = public.services.service_id ORDER BY public.appointments.appointment_date";
        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery(sql)) {

            while (resultSet.next()) {
                int id = resultSet.getInt("appointment_id");
                int patient_id =resultSet.getInt("patient_id");
                String patientName = resultSet.getString("patient_name");
                String  serviceName= resultSet.getString("Service_name");
                Date appointmentDate = resultSet.getDate("appointment_date");

                Appointment appointment = new Appointment();
                appointment.setId(id);
                appointment.setPatient_id(patient_id);
                appointment.setPatientName(patientName);
                appointment.setServiceName(serviceName);
                appointment.setDate(appointmentDate.toLocalDate());

                appointmentList.add(appointment);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return appointmentList;
    }

    public void addAppointment(CreateAppointmentDto createAppointmentDto) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("INSERT INTO public.appointments(patient_id, service_id, appointment_date) VALUES (?, ?, ?)")) {
            statement.setInt(1, createAppointmentDto.getPatient_id());
            statement.setInt(2, createAppointmentDto.getService_id());
            statement.setDate(3, Date.valueOf(createAppointmentDto.getDate()));
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteAppointment(int id) {

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("DELETE FROM public.appointments WHERE appointment_id = ?")) {
            statement.setInt(1, id);
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Appointment> selectAppointment(int id) {
        List<Appointment> appointmentList2 = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT public.patients.patient_name, public.services.service_name, public.appointments.appointment_date From public.appointments INNER JOIN public.patients ON public.appointments.patient_id = public.patients.patient_id INNER JOIN public.services ON public.appointments.service_id = public.services.service_id WHERE appointment_id = ?")) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {

                String patient_name = resultSet.getString("patient_name");
                String service_name = resultSet.getString("service_name");
                Date date = resultSet.getDate("appointment_date");

                Appointment appointment = new Appointment();
                appointment.setPatientName(patient_name);
                appointment.setServiceName(service_name);
                appointment.setDate(date.toLocalDate());
                appointmentList2.add(appointment);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return appointmentList2;
    }

    public void updateAppointment (Appointment appointment){
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE public.appointments SET service_id = ?, appointment_date = ? WHERE appointment_id = ?")) {
            statement.setInt(1, appointment.getService_id());
            statement.setDate(2, Date.valueOf(appointment.getDate()));
            statement.setInt(3, appointment.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

}


