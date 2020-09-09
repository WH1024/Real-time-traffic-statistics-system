package com.example.spark.scala.project.domain

/**
 * 课程点击数实体类
 * @param day_course  对应的就是HBase中的rowkey
 * @param click_count 对应的访问总数
 */
case class CourseClickCount(day_course:String, click_count:Long)