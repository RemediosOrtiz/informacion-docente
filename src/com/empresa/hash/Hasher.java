package com.empresa.hash;

import org.bouncycastle.crypto.digests.SHA256Digest;

public class Hasher {

	private static final String SALT = "SYSTEMLINK-5tic3";

	public Hasher() {}
	
	public String generateHash(String password) {
		password = SALT + password;

		byte[] input = password.getBytes();

		SHA256Digest d = new SHA256Digest();
		d.update(input, 0, input.length);
		byte[] result = new byte[d.getDigestSize()];
		d.doFinal(result, 0);

		String encriptado = "";
		
		for (int i = 0; i < result.length; i++) {
			encriptado += Integer.toString((result[i] & 0xff) + 0x100, 16).substring(1);
		}
		
		return encriptado;
	}
}
