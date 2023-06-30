package com.project.dndn.admin.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.project.dndn.admin.domain.ProductDTO;
import com.project.dndn.admin.mapper.ProductMapper;

@Service
public class ProductServiceImpl implements ProductService {

	/*
	 * @Autowired private ProductMapper mapper;
	 */
	
	@Autowired
	private ProductMapper mapper;
	
	//목록보기
	@Override
	public List<ProductDTO> list() {
		
		
		return mapper.list();
//		return null;
	}

}
