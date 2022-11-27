package model.bean;

public class Nhanvien_Phongban {
	private String IDNV;
	private String Hoten;
	private String Diachi;
	private String IDPB;
	private String Tenpb;
	private String Mota;
	
	public Nhanvien_Phongban(String _IDNV, String _Hoten, String _Diachi, String _IDPB, String _Tenpb, String _Mota) {
		this.IDNV = _IDNV;
		this.Hoten = _Hoten;
		this.Diachi = _Diachi;
		this.IDPB = _IDPB;
		this.Tenpb = _Tenpb;
		this.Mota = _Mota;
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

	public String getDiachi() {
		return Diachi;
	}

	public void setDiachi(String diachi) {
		Diachi = diachi;
	}

	public String getIDPB() {
		return IDPB;
	}

	public void setIDPB(String iDPB) {
		IDPB = iDPB;
	}

	public String getTenpb() {
		return Tenpb;
	}

	public void setTenpb(String tenpb) {
		Tenpb = tenpb;
	}

	public String getMota() {
		return Mota;
	}

	public void setMota(String mota) {
		Mota = mota;
	}
}
