package com.magicoh.springmvc.dto;
import java.io.Serializable;
import java.sql.Date;
/****************************************************************
 * 
 * This is a Qna Bbs
 * Created by OhYoungJoo
 * 2020.11.27
 *   
 ****************************************************************/
public class QnaBbs{

	private int no;			
	private String title;
	private String content;        	
	private String writer;  	
	private int hit;	   	
	private Date regdate;	
	
	public QnaBbs() {
	}

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
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

	public String getWriter() {
		return writer;
	}

	public void setWriter(String writer) {
		this.writer = writer;
	}

	public int getHit() {
		return hit;
	}

	public void setHit(int hit) {
		this.hit = hit;
	}

	public Date getRegdate() {
		return regdate;
	}

	public void setRegdate(Date regdate) {
		this.regdate = regdate;
	}
	

	
}
