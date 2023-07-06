package com.project.dndn.admin.mapper;

import java.util.List;

import com.project.dndn.admin.domain.ProductDTO;

public interface ProductMapper {

	List<ProductDTO> list();

	int add(ProductDTO dto);

	ProductDTO get(String lunchboxseq);

	int edit(ProductDTO dto);

	int del(ProductDTO dto);

	int del2(String lunchboxseq);

}
