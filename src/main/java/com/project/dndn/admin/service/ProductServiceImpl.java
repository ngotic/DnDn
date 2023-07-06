package com.project.dndn.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dndn.admin.domain.ProductDTO;
import com.project.dndn.admin.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {

	@Autowired
	private ProductMapper mapper;
	
	
	//목록보기
	@Override
	public List<ProductDTO> list() {
		
		return mapper.list();
	}

	//글쓰기
	@Override
	public int add(ProductDTO dto) {
		
		return mapper.add(dto);
	}
	
	//상세보기
	@Override
	public ProductDTO get(String lunchboxseq) {
		
		return mapper.get(lunchboxseq);
	}
	
	//수정하기
	@Override
	public int edit(ProductDTO dto) {
		
		return mapper.edit(dto);
	}
	
	//삭제하기
	@Override
	public int del(ProductDTO dto) {
		
		return mapper.del(dto);
	}
	
	@Override
	public int del2(String lunchboxseq) {
		
		return mapper.del2(lunchboxseq);
	}

}











