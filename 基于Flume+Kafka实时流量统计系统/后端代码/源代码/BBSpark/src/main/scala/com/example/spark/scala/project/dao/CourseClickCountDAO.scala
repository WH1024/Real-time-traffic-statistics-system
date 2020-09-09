package com.example.spark.scala.project.dao

import com.example.spark.java.project.utils.HBaseUtils
import com.example.spark.scala.project.domain.CourseClickCount
import org.apache.hadoop.hbase.client.Get
import org.apache.hadoop.hbase.util.Bytes

import scala.collection.mutable.ListBuffer

/**
 * 课程点击数-数据访问层
 */
object CourseClickCountDAO {
  val tableName = "course_clickcount"
  val cf = "info"
  val qualifer = "click_count"

  /**
   * 保存数据到HBase
   * @param list  CourseClickCount集合
   */
  def save(list: ListBuffer[CourseClickCount]):Unit = {
    val table = HBaseUtils.getInstance().getTable(tableName)
    for(ele <- list){
      table.incrementColumnValue(Bytes.toBytes(ele.day_course),
        Bytes.toBytes(cf),
        Bytes.toBytes(qualifer),
        ele.click_count)
    }
  }

  /**
   * 根据rowkey查询值
   */
  def count(day_course: String):Long = {
    val table = HBaseUtils.getInstance().getTable(tableName)

    val get = new Get(Bytes.toBytes(day_course))
    val value = table.get(get).getValue(cf.getBytes, qualifer.getBytes())

    if(value == null){
      0L
    }else{
      Bytes.toLong(value)
    }
  }

  def main(args: Array[String]): Unit = {
    val list = new ListBuffer[CourseClickCount]
    list.append(CourseClickCount("20200522_130",10))
    list.append(CourseClickCount("20200522_145",30))
    list.append(CourseClickCount("20200522_128",20))
    save(list)
    println(count("20200522_145") + " : " + count("20200522_130") + " : " + count("20200522_128"))
  }
}
