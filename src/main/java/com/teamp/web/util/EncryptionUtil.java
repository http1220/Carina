package com.teamp.web.util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.SecureRandom;
import java.security.Security;
import java.util.Arrays;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

public class EncryptionUtil {
    static {
        Security.addProvider(new BouncyCastleProvider());
    }

    public static String encrypt(String value, String secretKey) throws Exception {
        byte[] ivBytes = new byte[16];
        new SecureRandom().nextBytes(ivBytes);
        IvParameterSpec iv = new IvParameterSpec(ivBytes);

        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] keyBytes = digest.digest(secretKey.getBytes(StandardCharsets.UTF_8));
        SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");

        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.ENCRYPT_MODE, keySpec, iv);

        byte[] encrypted = cipher.doFinal(value.getBytes(StandardCharsets.UTF_8));
        byte[] combined = new byte[ivBytes.length + encrypted.length];

        System.arraycopy(ivBytes, 0, combined, 0, ivBytes.length);
        System.arraycopy(encrypted, 0, combined, ivBytes.length, encrypted.length);

        return Base64.getEncoder().encodeToString(combined);
    }
    public static String decrypt(String encryptedValue, String secretKey) throws Exception {
        byte[] combined = Base64.getDecoder().decode(encryptedValue);
        byte[] ivBytes = Arrays.copyOfRange(combined, 0, 16);
        IvParameterSpec iv = new IvParameterSpec(ivBytes);

        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] keyBytes = digest.digest(secretKey.getBytes(StandardCharsets.UTF_8));
        SecretKeySpec keySpec = new SecretKeySpec(keyBytes, "AES");

        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        cipher.init(Cipher.DECRYPT_MODE, keySpec, iv);

        byte[] decrypted = cipher.doFinal(combined, 16, combined.length - 16);

        return new String(decrypted, StandardCharsets.UTF_8);
    }

}

