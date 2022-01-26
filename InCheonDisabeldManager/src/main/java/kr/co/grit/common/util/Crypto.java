package kr.co.grit.common.util;

import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.security.spec.AlgorithmParameterSpec;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
//import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;


//import org.apache.commons.codec.CharEncoding;
import org.apache.commons.codec.binary.Base64;
//import org.apache.commons.codec.binary.Hex;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
//import java.security.SecureRandom;
import org.springframework.dao.DataAccessException;

public class Crypto {
	//키
	//private final static String KEY = "01234567890123456789012345678901";
	
	//128bit(16자리)
	//private final static String KEY_128 = KEY.substring(0,128/8);//"0123456789012345";
	//256bit(16자리)
	//private final static String KEY_256 = KEY.substring(0,256/8);;
	
	private static final Logger LOGGER = LoggerFactory.getLogger(Crypto.class);
	
    public static final String KEY = "xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx";
    public static final byte[] KEY_ARRAY = Base64.decodeBase64(KEY);
	
//	//AES 128암호화
//	public static String encryptAES128(String str) {
//		try {
//			byte[] keyData = KEY_128.getBytes(CharEncoding.UTF_8);
//			System.out.println(" agentId AES256Cipher 128 keyData  ====[" + keyData.toString()+"]");
//			//운용모드 CBC,패딩은 PKCS5Padding
//			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
//			
//			cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(keyData,"AES"),new IvParameterSpec(keyData));
//			
//			//AES암호화
//			byte[] encrypted = cipher.doFinal(str.getBytes(CharEncoding.UTF_8));
//			System.out.println(" agentId AES256Cipher 128 encrypted  ====[" + encrypted.toString()+"]");
//			//base64인코딩
//			byte[] base64Encoded = Base64.encodeBase64(str.getBytes(CharEncoding.UTF_8));
//			System.out.println(" agentId AES256Cipher 128 base64Encoded  ====[" + base64Encoded.toString()+"]");
//			String result = new String(base64Encoded,CharEncoding.UTF_8);
////			String result = new String(encrypted,CharEncoding.UTF_8);
//			return result;
//		} catch (Exception e) {
//			return null;
//		}
//	}
//	//AES 128복호화
//	public static String decryptAES128(String str) {
//		try {
//			byte[] keyData = KEY_128.getBytes(CharEncoding.UTF_8);
//			System.out.println(" agentId decryptAES128 128 str  ====[" + str+"]");
//			//운용모드 CBC,패딩은 PKCS5Padding
//			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
//			
//			cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(keyData,"AES"),new IvParameterSpec(keyData));
//	
//			//base64디코딩
//			byte[] base64Decoded = Base64.decodeBase64(str.getBytes(CharEncoding.UTF_8));
//			System.out.println(" agentId AES256Cipher 128 base64Encoded  ====[" + base64Decoded.toString()+"]");
//			//AES복호화
//			byte[] decrypted = cipher.doFinal(base64Decoded);
////			byte[] decrypted = cipher.doFinal(str.getBytes(CharEncoding.UTF_8));
////			cipher.
//			String result = new String(decrypted,CharEncoding.UTF_8);
//			
//			return result;
//		} catch (Exception e) {
//			System.out.println(e.getStackTrace());
//			return null;
//		}
//	}
//	//AES 128암호화
//	public static String encryptAES256(String str) {
//		try {
//			byte[] key256Data = KEY_256.getBytes(CharEncoding.UTF_8);
//			byte[] key128Data = KEY_128.getBytes(CharEncoding.UTF_8);
//			System.out.println(" agentId AES256Cipher 256 strEncode  ====[" + key256Data.toString()+"]");
//			//운용모드 CBC,패딩은 PKCS5Padding
//			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
//			
//			cipher.init(Cipher.ENCRYPT_MODE, new SecretKeySpec(key256Data,"AES"),new IvParameterSpec(key128Data));
//			
//			//AES암호화
//			byte[] encrypted = cipher.doFinal(str.getBytes(CharEncoding.UTF_8));
//			
//			//base64인코딩
//			byte[] base64Encoded = Base64.encodeBase64(encrypted);
//			
//			String result = new String(base64Encoded,CharEncoding.UTF_8);
////			String result = new String(encrypted,CharEncoding.UTF_8);
//			return result;
//		} catch (Exception e) {
//			return null;
//		}
//	}
//	//AES 256복호화
//	public static String decryptAES256(String str) {
//		try {
//			byte[] key256Data = KEY_256.getBytes(CharEncoding.UTF_8);
//			byte[] key128Data = KEY_128.getBytes(CharEncoding.UTF_8);
//			
//			//운용모드 CBC,패딩은 PKCS5Padding
//			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
//			
//			cipher.init(Cipher.DECRYPT_MODE, new SecretKeySpec(key256Data,"AES"),new IvParameterSpec(key128Data));
//	
//			//base64디코딩
//			byte[] base64Decoded = Base64.decodeBase64(str.getBytes(CharEncoding.UTF_8));
//			
//			//AES복호화
//			byte[] decrypted = cipher.doFinal(base64Decoded);
////			byte[] decrypted = cipher.doFinal(str.getBytes(CharEncoding.UTF_8));
//				
//			String result = new String(decrypted,CharEncoding.UTF_8);
//			
//			return result;
//		} catch (Exception e) {
//			return null;
//		}
//	}
	
    
	public static byte[] ivBytes = { 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00 };


	public String aesEncode(String str, String key)	throws java.io.UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException,	IllegalBlockSizeException, BadPaddingException {
		try {
			byte[] textBytes = str.getBytes("UTF-8");
			AlgorithmParameterSpec ivSpec = new IvParameterSpec(ivBytes);
			SecretKeySpec newKey = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
			Cipher cipher = null;
			cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			cipher.init(Cipher.ENCRYPT_MODE, newKey, ivSpec);
			return Base64.encodeBase64String(cipher.doFinal(textBytes));
		
		} catch (DataAccessException de) {
			LOGGER.debug("");
		} catch (Exception e) {
			LOGGER.debug("");
		}
        return null;
	}

	public String aesDecode(String str, String key)	throws java.io.UnsupportedEncodingException, NoSuchAlgorithmException, NoSuchPaddingException, InvalidKeyException, InvalidAlgorithmParameterException, IllegalBlockSizeException, BadPaddingException {
		try {
			byte[] textBytes = Base64.decodeBase64(str);
			//byte[] textBytes = str.getBytes("UTF-8");
			AlgorithmParameterSpec ivSpec = new IvParameterSpec(ivBytes);
			SecretKeySpec newKey = new SecretKeySpec(key.getBytes("UTF-8"), "AES");
			Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
			cipher.init(Cipher.DECRYPT_MODE, newKey, ivSpec);
			return new String(cipher.doFinal(textBytes), "UTF-8");
		} catch (DataAccessException de) {
			LOGGER.debug("");
		} catch (Exception e) {
			LOGGER.debug("");
		}
	    return null;
	}
}
