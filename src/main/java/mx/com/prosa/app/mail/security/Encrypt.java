package mx.com.prosa.app.mail.security;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

/**
 * Class for encrypt password using SHA1
 * @author carlos flores martinez
 */
import org.apache.log4j.Logger;

public class Encrypt {
    private static final Logger logger = Logger.getLogger(Encrypt.class);

    /**
     * Apply algorithm SHA1 to string input
     * @param message
     * @return
     */
    public static String getStringMessageDigest(String message) {
	byte[] digest = null;
	byte[] buffer = message.getBytes();
	try {
	    MessageDigest messageDigest = MessageDigest.getInstance("SHA1");
	    messageDigest.reset();
	    messageDigest.update(buffer);
	    digest = messageDigest.digest();
	} catch (NoSuchAlgorithmException ex) {
	    logger.error("Error to diggest message");
	}
	return toHexadecimal(digest);
    }

    /**
     * Convert hexadecimal to string value
     * @param digest
     * @return
     */
    public static String toHexadecimal(byte[] digest) {
	String hash = "";
	for (byte aux : digest) {
	    int b = aux & 0xff;
	    if (Integer.toHexString(b).length() == 1)
		hash += "0";
	    hash += Integer.toHexString(b);
	}
	return hash;
    }
}
