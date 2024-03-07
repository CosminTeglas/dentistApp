package model.dto;

import lombok.Data;
import model.Patient;
@Data

public class PatientDto {

    private int id;
    private String name;
    private String email;

    public static PatientDto toDto(Patient student) {
        PatientDto studentDto = new PatientDto();
        studentDto.setName(student.getName());
        studentDto.setEmail(student.getEmail());
        return studentDto;
    }
}
