package com.touchblankspot.inventory.portal.service;

import com.touchblankspot.inventory.portal.data.model.Stock;
import com.touchblankspot.inventory.portal.data.repository.StockRepository;
import java.util.List;
import java.util.Optional;
import java.util.UUID;
import lombok.NonNull;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;

@Service
@Slf4j
@RequiredArgsConstructor(onConstructor = @__({@Autowired}))
public class StockService {
  @NonNull private final StockRepository stockRepository;

  public Stock save(Stock stock) {
    return stockRepository.save(stock);
  }

  public Page<Object[]> getListData(Pageable pageable, String searchType, String searchKey) {
    return stockRepository.getListData(pageable, searchType, searchKey);
  }

  public List<String> getAutoCompleteSuggestions(String searchType, String searchKey) {
    return stockRepository.getAutoCompleteSuggestions(searchType, searchKey);
  }

  public Optional<Stock> findByProductIdAndProductSize(UUID productId, String size) {
    return stockRepository.findByProductIdAndProductSize(productId, size);
  }

  public Long getCurrentStock(UUID productId, String size) {
    Optional<Stock> optionalStock = findByProductIdAndProductSize(productId, size);
    return optionalStock.isPresent() ? optionalStock.get().getQuantity() : 0L;
  }
}
