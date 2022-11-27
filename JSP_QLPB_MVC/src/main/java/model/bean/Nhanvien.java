package model.bean;

public class Nhanvien {
	
	private String IDNV;
	private String Hoten;
	private String IDPB;
	private String Diachi;
	
	public Nhanvien(String _IDNV, String _Hoten, String _Diachi,String _IDPB) {
		this.IDNV = _IDNV;
		this.Hoten = _Hoten;
		this.Diachi = _Diachi;
		this.IDPB = _IDPB;
	}

	public String getIDNV() {
		return IDNV;
	}

	public void setIDNV(String iDNV) {
		IDNV = iDNV;
	}

	public String getHoten() {
		return Hoten;
	}

	public void setHoten(String hoten) {
		Hoten = hoten;
	}

	public String getIDPB() {
		return IDPB;
	}

	public void setIDPB(String iDPB) {
		IDPB = iDPB;
	}

	public String getDiachi() {
		return Diachi;
	}

	public void setDiachi(String diachi) {
		Diachi = diachi;
	}

}
