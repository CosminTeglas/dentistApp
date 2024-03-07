package model.dto;

import lombok.Data;

import java.time.LocalDate;

@Data
public class CreateAppointmentDto {
    private int id;
    private int patient_id;
    private int service_id;
    private LocalDate date;

    public CreateAppointmentDto() {
    }

    public CreateAppointmentDto(int patient_id, int service_id, LocalDate date) {
        this.patient_id = patient_id;
        this.service_id = service_id;
        this.date = date;
    }

    public CreateAppointmentDto(int id, int patient_id, int service_id, LocalDate date) {
        this.id = id;
        this.patient_id = patient_id;
        this.service_id = service_id;
        this.date = date;
    }
}
