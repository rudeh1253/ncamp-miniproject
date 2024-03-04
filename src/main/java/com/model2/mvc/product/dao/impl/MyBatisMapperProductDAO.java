package com.model2.mvc.product.dao.impl;

import com.model2.mvc.common.ListData;
import com.model2.mvc.common.dto.Search;
import com.model2.mvc.product.dao.ProductDAO;
import com.model2.mvc.product.domain.Product;
import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.dao.DataAccessException;
import org.springframework.stereotype.Repository;

import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Optional;

@Repository("myBatisMapperProductDAO")
public class MyBatisMapperProductDAO implements ProductDAO {
    private final SqlSession sqlSession;

    @Autowired
    public MyBatisMapperProductDAO(@Qualifier("sqlSessionTemplate") SqlSession sqlSession) {
        this.sqlSession = sqlSession;
    }

    @Override
    public Optional<Product> findById(int prodNo) {
        return Optional.ofNullable(this.sqlSession.selectOne("ProductMapper.findById", prodNo));
    }

    @Override
    public Map<Integer, Product> findProductsByIds(List<Integer> ids) {
        List<Product> productsFound = this.sqlSession.selectList("ProductMapper.findProductsByIds", ids);
        Map<Integer, Product> idProductMap = new HashMap<>();
        productsFound.forEach(p -> idProductMap.put(p.getProdNo(), p));
        return idProductMap;
    }

    @Override
    public ListData<Product> findProductsByProdName(Search search) {
        return this.sqlSession.selectOne("ProductMapper.findProducts", search);
    }

    @Override
    public boolean insertProduct(Product toInsert) {
        try {
            this.sqlSession.insert("ProductMapper.insert", toInsert);
            return true;
        } catch (DataAccessException e) {
            e.printStackTrace();
            return false;
        }
    }

    @Override
    public boolean updateProduct(Product to) {
        try {
            this.sqlSession.insert("ProductMapper.update", to);
            return true;
        } catch (DataAccessException e) {
            e.printStackTrace();
            return false;
        }
    }
}
