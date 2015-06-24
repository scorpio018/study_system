package com.study.core.mapper;

import org.springframework.stereotype.Repository;

@Repository
public interface LoginMapper {

	public boolean login() throws Exception;
}
