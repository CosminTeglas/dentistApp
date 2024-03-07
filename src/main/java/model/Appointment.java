package model;

import lombok.Data;

import java.time.LocalDate;

@Data

public class Appointment {
    private int id;
    private int patient_id;

    public Appointment(int id, int patient_id, int service_id, String patientName, String serviceName, LocalDate date) {
        this.id = id;
        this.patient_id = patient_id;
        this.service_id = service_id;
        this.patientName = patientName;
        this.serviceName = serviceName;
        this.date = date;
    }

    private int service_id;
    private String patientName;
    private String serviceName;
    private LocalDate date;

    public Appointment(int id, int service_id, LocalDate date) {
        this.id = id;
        this.service_id = service_id;
        this.date = date;
    }

    public Appointment(String patientName, String serviceName, LocalDate date) {
        this.patientName = patientName;
        this.serviceName = serviceName;
        this.date = date;
    }

    public Appointment() {
    }

    public Appointment(int id, String patientName, String serviceName, LocalDate date) {
        this.id = id;
        this.patientName = patientName;
        this.serviceName = serviceName;
        this.date = date;
    }


}
