
// Definition for String Manipulation Routines
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
	
	// Determine if a string is a Palindrome
	public static boolean Palindrome( String s ) {
		int length = s.length();
		for ( int i = 0; i < length / 2; i++ ) {
			if ( s.charAt( i ) != s.charAt( length - i - 1 ) )
				return false;
		}
		return true;
	}
	
	// Determine if a string is a Palindrome for Phrases
	public static boolean PalindromeP( String s ) {
		int length = s.length();
		for ( int i = 0, j = length - 1; i < j; /**/ ) {
			if ( isPunctOrSpace( s.charAt( i ) ) )  {
				i++;
				continue;
			}
			if ( isPunctOrSpace( s.charAt( j ) ) ) {
				j--;
				continue;
			}

			if ( Character.toLowerCase( s.charAt( i ) ) != Character.toLowerCase( s.charAt( j ) ) )
				return false;
			i++; 
			if ( j != i ) j--;
		}
		return true;
	}
	
	public static boolean isPunctOrSpace(final char c) {
		final int val = (int)c;
		return  ( val >= 32 && val <= 47 ) ||
				( val >= 58 && val <= 64 ) ||
				( val >= 91 && val <= 96 ) ||
				( val >= 123 && val <= 126 );
	}
	
	// Count the number of occurrences of a character in a string
	public static short[] CharOccur( String s ) {
		short[] counter = new short[96];	// codes 32 .. 127 are printable (so skip first 32)
		int length = s.length();
		// use counter as an accumulator while we count each character in string
		for ( int i = 0; i < length; i++ )
			counter[ (int) s.charAt( i ) - 32 ]++;	// offset ascii code by 32
		return counter;
	}
	
	// Count all duplicated characters
	public static short[] DupChar( String s ) {
		// Get the character occurrences
		short[] dup = CharOccur( s );
		// Mask out all single count occurrences
		for ( int i = 0; i < dup.length; i++ )
			dup[ i ] &= ~0x001;
		return dup;
	}
	
	public static void main( String[] args ) {
		System.out.println( Reverse( "abcdefg" ) );
		System.out.println( ReverseR( "abcdefg" ) );
		System.out.println( Palindrome( "noon" ) );
		System.out.println( Palindrome( "rotator" ) );
		System.out.println( Palindrome( "notone" ) );
		System.out.println( PalindromeP( "my gym" ) );
		System.out.println( PalindromeP( "Red rum, sir, is murder" ) );
		short[] res = CharOccur( "jack and jill jumped over the hill to fetch a pale of water");
		for ( int i = 32; i < 128; i++ )
			if ( res[ i - 32 ] > 0 ) System.out.println( (char) i + ": " + res[ i - 32 ] );
		res = DupChar( "jack and jill jumped over the hill to fetch a pale of water");
		for ( int i = 32; i < 128; i++ )
			if ( res[ i - 32 ] > 0 ) System.out.println( (char) i + ": " + res[ i - 32 ] );
	}
}