package skt1.dtos;

import java.util.Date;

public class AnsDto {

	public int seq;
	public String id;
	public String title;
	public String content;
	public Date regdate;
	public int refer;
	public int step;
	public int depth;
	public int readcount;
	public String delflag;

	//생성자(default)
	public AnsDto() {
		super();
		// TODO Auto-generated constructor stub
	}

	//생성자오버로딩(맴버필드 초기화)
	public AnsDto(int seq, String id, String title, String content, Date regdate, int refer, int step, int depth,
			int readcount, String delflag) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
		this.regdate = regdate;
		this.refer = refer;
		this.step = step;
		this.depth = depth;
		this.readcount = readcount;
		this.delflag = delflag;
	}

	
	public AnsDto(String id, String title, String content) {
		super();
		this.id = id;
		this.title = title;
		this.content = content;
	}
	
	
	public AnsDto(int seq, String title, String content) {
		super();
		this.seq = seq;
		this.title = title;
		this.content = content;
	}
	
	public AnsDto(int seq, String id, String title, String content) {
		super();
		this.seq = seq;
		this.id = id;
		this.title = title;
		this.content = content;
	}

	//get/set메서드 
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

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}

	public int getRefer() {
		return refer;
	}

	public void setRefer(int refer) {
		this.refer = refer;
	}

	public int getStep() {
		return step;
	}

	public void setStep(int step) {
		this.step = step;
	}

	public int getDepth() {
		return depth;
	}

	public void setDepth(int depth) {
		this.depth = depth;
	}

	public int getReadcount() {
		return readcount;
	}

	public void setReadcount(int readcount) {
		this.readcount = readcount;
	}

	public String getDelflag() {
		return delflag;
	}

	public void setDelflag(String delflag) {
		this.delflag = delflag;
	}

	//toString()오버라이딩
	@Override
	public String toString() {
		return "AnsDto [seq=" + seq + ", id=" + id + ", title=" + title + ", content=" + content + ", regdate="
				+ regdate + ", refer=" + refer + ", step=" + step + ", depth=" + depth + ", readcount=" + readcount
				+ ", delflag=" + delflag + "]";
	}
	
	
	
	
}





