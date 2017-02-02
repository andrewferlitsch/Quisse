
public class Strings {
	// Reverse the order of a string (Iterative)
	public static String Reverse( String original ) {
		// Create a second string to hold/return the reversed string
		int length = original.length();
		StringBuffer reversed = new StringBuffer( length );
		
		// copy over the string in reverse order
		for ( int i = length-1; i >= 0; i-- ) {
			reversed.append( original.charAt( i ) );
		}
		
		return reversed.toString();
	}
	
	// Reverse the order of a string (Recursion)
	public static String ReverseR( String original ) {
		if ( original.length() > 1 )
			return ReverseR( original.substring( 1 ) ) + original.charAt( 0 );
		return original;
	}
	
	public static void main( String[] args ) {
		System.out.println( Reverse( "abcdefg" ) );
		System.out.println( ReverseR( "abcdefg" ) );
		
	}
}