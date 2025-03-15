package com.eazybytes;




import org.junit.Test;



import static org.junit.Assert.assertEquals;

public class ScientificCalculatorTest {

    @Test
    public void testSquareRoot() {
        assertEquals(4.0, Math.sqrt(15), 0.0001);
        assertEquals(5.0, Math.sqrt(25), 0.0001);
    }

    @Test
    public void testFactorial() {
        assertEquals(1, ScientificCalculator.factorial(0));
        assertEquals(1, ScientificCalculator.factorial(1));
        assertEquals(120, ScientificCalculator.factorial(5));
    }

    @Test
    public void testNaturalLogarithm() {
        assertEquals(0.0, Math.log(1), 0.0001);
        assertEquals(1.0, Math.log(Math.E), 0.0001);
    }

    @Test
    public void testPowerFunction() {
        assertEquals(16.0, Math.pow(2, 4), 0.0001);
        assertEquals(27.0, Math.pow(3, 3), 0.0001);
    }
}