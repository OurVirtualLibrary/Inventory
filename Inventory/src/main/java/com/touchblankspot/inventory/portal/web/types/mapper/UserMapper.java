package com.touchblankspot.inventory.portal.web.types.mapper;

import com.touchblankspot.inventory.portal.data.model.User;
import com.touchblankspot.inventory.portal.web.types.user.RegisterAdminRequest;
import com.touchblankspot.inventory.portal.web.types.user.RegisterUserRequest;
import org.mapstruct.InjectionStrategy;
import org.mapstruct.Mapper;
import org.mapstruct.ReportingPolicy;

@Mapper(
    componentModel = "spring",
    injectionStrategy = InjectionStrategy.CONSTRUCTOR,
    unmappedTargetPolicy = ReportingPolicy.IGNORE)
public interface UserMapper {

  User toEntity(RegisterAdminRequest request);

  User toEntity(RegisterUserRequest request);
}
