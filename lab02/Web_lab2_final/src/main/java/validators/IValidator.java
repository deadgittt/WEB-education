package validators;

public interface IValidator {
    boolean validateX(String xString);
    boolean validateY(String yString);
    boolean validateR(String rString);
    boolean isHit();
}
