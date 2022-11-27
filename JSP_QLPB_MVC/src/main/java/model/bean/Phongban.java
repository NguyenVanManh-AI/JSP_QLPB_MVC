package model.bean;

public class Phongban {
	private String IDPB;
	private String Tenpb;
	private String Mota;
	
	public Phongban(String _IDPB, String _Tenpb, String _Mota) {
		this.IDPB = _IDPB;
		this.Tenpb = _Tenpb;
		this.Mota = _Mota;
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
