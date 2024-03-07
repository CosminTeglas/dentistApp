package model;
import lombok.Data;
import lombok.Getter;
import lombok.Setter;
import lombok.ToString;

@Getter
@Setter
@ToString
@Data

public class Service {

    private int id;
    private String name;
    private int price;

    public Service(String name, int price) {
        this.name = name;
        this.price = price;
    }

    public Service() {
    }

    public Service(int id) {
        this.id = id;
    }

    public Service(int id, String name, int price) {
        this.id = id;
        this.name = name;
        this.price = price;
    }
}
