package com.project.dndn.admin.service;

import java.util.List;

import com.project.dndn.admin.domain.ProductDTO;

public interface ProductService {

	List<ProductDTO> list();

	int add(ProductDTO dto);

	ProductDTO get(String lunchboxseq);

	int edit(ProductDTO dto);

	int del(String lunchboxseq);


}
