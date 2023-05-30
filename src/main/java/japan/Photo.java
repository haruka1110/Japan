package japan;

public class Photo {
    private int id;
    private String date;
    private String location;
    private byte[] photoData;

    public Photo(int id, String date, String location, byte[] photoData) {
        this.id = id;
        this.date = date;
        this.location = location;
        this.photoData = photoData;
    }

    public int getId() {
        return id;
    }

    public String getDate() {
        return date;
    }

    public String getLocation() {
        return location;
    }

    public byte[] getPhotoData() {
        return photoData;
    }
}
