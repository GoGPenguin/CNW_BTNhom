package Ultilities;

public enum Role {
    WRONG(0),
    ADMIN(1),
    USER(2);

    private final int value;

    Role(int value) {
        this.value = value;
    }

    public int getValue() {
        return value;
    }
}