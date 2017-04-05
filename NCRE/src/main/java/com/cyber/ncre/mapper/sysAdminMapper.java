package com.cyber.ncre.mapper;

import java.util.List;

import com.cyber.ncre.entity.academyAdmin;
import com.cyber.ncre.entity.sysAdmin;

public interface sysAdminMapper {

	sysAdmin findsysAdmin(sysAdmin admin);

	List<academyAdmin> findapply();

}
