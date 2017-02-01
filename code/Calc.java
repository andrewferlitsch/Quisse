public class Calc
{
	// Multiple using only + and equal operator
	public static int Mul( int x, int y ) {
		int result = 0;
		int repeat = 0;
		while ( true ) {
			if ( repeat++ == y )
				break;
			result += x;
		}
		return result;
	}
	
	// Exponent using only + and equal operator
	public static int Exp( int x, int e ) {
		if ( e == 0 )
			return 1;
		int result = 1;
		int repeat = 0;
		while ( true ) {
			if ( repeat++ == e )
				break;
			result = Mul( x, result );
		}
		return result;
	}
	
	// Exponent with half the multiplications
	public static int Exp2( int x, int e ) {
		if ( e == 0 )
			return 1;
		// even
		if ( ( e % 2 ) == 0 )
			return Exp( x * x, ( e / 2 ) );
		// odd
		else
			return x * Exp( x * x, ( ( e - 1 ) / 2  ) );
	}
	
	public static void main(String[] args) {
		System.out.println( "5 * 6 = " + Mul( 5, 6 ) );
		System.out.println( "3 exp 4 = " + Exp( 3, 4 ) );
		System.out.println( "3 exp 4 = " + Exp2( 3, 4 ) );
	}
}