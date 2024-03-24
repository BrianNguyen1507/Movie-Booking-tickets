package com.cinema.api.output;

import java.util.ArrayList;
import java.util.List;

import com.cinema.dto.FilmDTO;

public class FilmOutput {
	private int page;
	private int totalPage;
	private List<FilmDTO> listResult = new ArrayList<>();
	public int getPage() {
		return page;
	}
	public void setPage(int page) {
		this.page = page;
	}
	public int getTotalPage() {
		return totalPage;
	}
	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}
	public List<FilmDTO> getListResult() {
		return listResult;
	}
	public void setListResult(List<FilmDTO> listResult) {
		this.listResult = listResult;
	}
	
}
