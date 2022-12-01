package com.touchblankspot.inventory.portal.service;

import com.touchblankspot.inventory.portal.data.model.ProductCategory;
import com.touchblankspot.inventory.portal.data.repository.ProductCategoryRepository;
import java.util.List;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor(onConstructor = @__({@Autowired}))
public class ProductCategoryService {
  @NonNull private final ProductCategoryRepository productCategoryRepository;

  public ProductCategory save(ProductCategory productCategory) {
    return productCategoryRepository.save(productCategory);
  }

  public List<ProductCategory> findByProductSize(String productSize) {
    return productCategoryRepository.findByProductSize(productSize);
  }

  public List<ProductCategory> findByCategory(String category) {
    return productCategoryRepository.findByCategory(category);
  }

  public List<ProductCategory> findBySubCategory(String subCategory) {
    return productCategoryRepository.findBySubCategory(subCategory);
  }
}