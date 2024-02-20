package beans;

import java.io.Serializable;
import java.util.LinkedList;

public class PointsArray implements Serializable {

    private LinkedList<Point> points = new LinkedList<>();

    public LinkedList<Point> getPoints() {
        return points;
    }

    public void setPoints(LinkedList<Point> points) {
        this.points = points;
    }

    public void addPoint(Point point){
        this.points.addFirst(point);
    }
}
