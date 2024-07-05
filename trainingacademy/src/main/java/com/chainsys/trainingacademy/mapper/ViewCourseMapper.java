package com.chainsys.trainingacademy.mapper;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

import com.chainsys.trainingacademy.model.Course;

public class ViewCourseMapper implements RowMapper<Course> {

	@Override
	public Course mapRow(ResultSet rs, int rowNum) throws SQLException {
		Course viewCourse=new Course();
		viewCourse.setCourseId(rs.getInt("course_id"));
		viewCourse.setCourseName(rs.getString("course_name"));
		viewCourse.setCourseType(rs.getString("course_type"));
		viewCourse.setCourseImage(rs.getBytes("course_image"));
		System.out.println(viewCourse.getCourseImage());
		return viewCourse;
	}

}
