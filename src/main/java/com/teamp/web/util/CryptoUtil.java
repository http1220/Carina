package com.teamp.web.util;

import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.util.Base64;

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

public class CryptoUtil {

    public static String encrypt(String data, String key) throws Exception {
        // SHA-256으로 키 해시
        MessageDigest digest = MessageDigest.getInstance("SHA-256");
        byte[] hashedKey = digest.digest(key.getBytes(StandardCharsets.UTF_8));

        // 해시된 키로 AES 암호 생성
        Cipher cipher = Cipher.getInstance("AES/CBC/PKCS5Padding");
        SecretKeySpec secretKeySpec = new SecretKeySpec(hashedKey, "AES");

        // IV 생성(초기화 벡터)
        byte[] iv = new byte[16]; // AES-128용 16바이트 IV
        IvParameterSpec ivParameterSpec = new IvParameterSpec(iv);

        // 데이터 암호화
        cipher.init(Cipher.ENCRYPT_MODE, secretKeySpec, ivParameterSpec);
        byte[] encryptedData = cipher.doFinal(data.getBytes(StandardCharsets.UTF_8));

        // 암호화된 데이터를 base64 문자열로 인코딩
        return Base64.getEncoder().encodeToString(encryptedData);
    }
}
