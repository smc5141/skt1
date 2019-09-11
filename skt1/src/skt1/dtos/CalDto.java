package skt1.dtos;

import java.util.Date;

public class CalDto {

	private int seq;
	private String id;
	private String title;
	private String content;
	private String mdate;
	private Date regDate;
	private String teamname;
	private int ourscore;
	private int otherscore;
	
	public CalDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CalDto(int seq, String id, String title, String content, String mdate, Date regDate, String teamname,
			int ourscore, int otherscore) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.mdate = mdate;
		this.regDate = regDate;
		this.teamname = teamname;
		this.ourscore = ourscore;
		this.otherscore = otherscore;
	}

	public int getSeq() {
		return seq;
	}

	public void setSeq(int seq) {
		this.seq = seq;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getContent() {
		return content;
	}

	public void setContent(String content) {
		this.content = content;
	}

	public String getMdate() {
		return mdate;
	}

	public void setMdate(String mdate) {
		this.mdate = mdate;
	}

	public Date getRegDate() {
		return regDate;
	}

	public void setRegDate(Date regDate) {
		this.regDate = regDate;
	}

	public String getTeamname() {
		return teamname;
	}

	public void setTeamname(String teamname) {
		this.teamname = teamname;
	}

	public int getOurscore() {
		return ourscore;
	}

	public void setOurscore(int ourscore) {
		this.ourscore = ourscore;
	}

	public int getOtherscore() {
		return otherscore;
	}

	public void setOtherscore(int otherscore) {
		this.otherscore = otherscore;
	}

	@Override
	public String toString() {
		return "CalDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", mdate=" + mdate
				+ ", regDate=" + regDate + ", teamname=" + teamname + ", ourscore=" + ourscore + ", otherscore="
				+ otherscore + "]";
	}
	
	
	
		
	
}