package repository;

import model.Service;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class ServiceRepository extends JdbcRepository {
    public  ServiceRepository() {
        getConnection();
    }

    public List<Service> getAllServices() {
        List<Service> servicesList = new ArrayList<>();

        try (Connection connection = getConnection();
             Statement statement = connection.createStatement();
             ResultSet resultSet = statement.executeQuery("SELECT * FROM public.services")) {

            while (resultSet.next()) {
                int id = resultSet.getInt("service_id");
                String name = resultSet.getString("service_name");
                int price = resultSet.getInt("service_price");

                Service service = new Service();
                service.setId(id);
                service.setName(name);
                service.setPrice(price);

                servicesList.add(service);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }

        return servicesList;
    }

    public void addService(Service service) {
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("INSERT INTO public.services(service_name, service_price) VALUES (?, ?)")) {
            statement.setString(1, service.getName());
            statement.setInt(2, service.getPrice());
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    public void deleteService(int id) {

        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("DELETE FROM public.services WHERE service_id = ?")) {
            statement.setInt(1, id);
            statement.executeUpdate();

        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
    public List<Service> selectService(int id) {
        List<Service> serviceList2 = new ArrayList<>();
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("SELECT * FROM public.services WHERE service_id = ?")) {
            statement.setInt(1, id);
            ResultSet resultSet = statement.executeQuery();
            while (resultSet.next()) {

                int resultId = resultSet.getInt("service_id");
                String name = resultSet.getString("service_name");
                int price = resultSet.getInt("service_price");

                Service service = new Service();
                service.setId(resultId);
                service.setName(name);
                service.setPrice(price);

                serviceList2.add(service);
            }
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return serviceList2;
    }

    public void updateService (Service service){
        try (Connection connection = getConnection();
             PreparedStatement statement = connection.prepareStatement("UPDATE public.services SET service_name = ? , service_price = ? WHERE service_id = ?")) {
            statement.setString(1, service.getName());
            statement.setInt(2, service.getPrice());
            statement.setInt(3, service.getId());
            statement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
