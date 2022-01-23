require "import"
import "android.app.*"
import "android.os.*"
import "android.widget.*"
import "android.view.*"
activity.setTitle('sqlite数据库操作')
activity.setTheme(android.R.style.Theme_Holo_Light)
--本篇来自nirenr，用于研究和扩展。
bj={
  LinearLayout;
  orientation="vertical";
  layout_height="fill";
  layout_width="fill";
  {
    HorizontalScrollView;
    {
      LinearLayout;
    {
      Button;
      text="创建表";
      id="btn1";
    };
    {
      Button;
      text="添加列";
      id="btn2";
    };
    {
      Button;
      text="查询表内所有数据";
      id="btn3";
    };
    };
  };
  {
    TextView;
    layout_width="fill";
    text="hello AndroLua+";
  };
};


activity.setContentView(loadlayout(bj))
--[[

【常用SQL语句】

1.数据类型：
整型：int
     字符󿆬har(6)
  varchar(24)
文本：text
   布尔󿆫it
   
日期：smalldatetime

2.删除表：
drop table 表名

3.修改表：
alter table 表名 add 字段 类型
//加约束
alter table 表名 add constraint 约束

4.创建表：
create table 表名(
字段 类型 primary key,
字段 类型 default'񐏁' check(字段 in('񐏁','񐏂'))
)
//多个主键在最后面：
primary key(字񫭑,字񫭒)
//参照：
后面加：references 表名(字段)
//条件：
不为空：not null
唯一性：unique
//约束：
check(字段>=值 and 字段<=值)
check(字段 in('񐏁','񐏂'))

5.查询语句：
select * from 表名 where 条件语句

6.插入数据：
insert into 表名(字段列表) values(值列表)

7.更新语句：
update 表名 set 字段名 = 值 where 条件

8.删除语句：
delete from 表名 where 条件

9.分页查询：
select * from Account limit 3,5
(获񓵥条记录，跳过前򗘣条)

--一一一一一一一一一一一一一一一一一一一一

【常用SQL语񓹒】

1.子查询：
例：
select 学号,成绩 from xs_kc 
where 课程号=(select 课程号 from kc where 课程名='计算机基础')

2.连接查询：
例：
select 学号,成绩 from xs_kc，kc
where xs_kc.课程号=kc.课程号
add 课程名='计算机基础'

3.创建存储过程：
//根据名字查询平均成绩，输入参数，输出参数
create proc pxs_avgByName(
	@name char(8) ,@avg float output
)
as
	set @avg=(select avg(成绩) 
	from xs,xs_kc 
	where xs.学号=xs_kc.学号 
	and xs.姓名=@name)
go
//执行存储过程
declare @ag float
exec pxs_avgByName '李林',@avg output
select '平均分' =@ag

4.创建触发器：
//如果在XS表中添加或修改的学生学号不是以�����”开头，
//则使用RAISERROR语句向客户端显示一条信息“学号必修�����开头”。
create trigger tri_n
on xs
for insert,update
as 
	declare @i char(6)
	select @i=学号 from inserted
	if @i not like '08%'
	begin
		ROLLBACK  TRANSACTION 
		RAISERROR ('学号必修�����开头，操作已经撤消！', 16, 10)
	end
go

--一一一一一一一一一一一一一一一一一一一一一

//插入数据
public void insertData(SQLiteDatabase db,String table,Article article){
	ContentValues values = new ContentValues();
	values.put("title",article.getTitle());
	values.put("author", article.getAuthor());

	db.insert(table, null, values);
}

//删除数据
public void deletData(SQLiteDatabase db,String table,Integer id){
	db.delete(table, "_id=?", new String[]{id.toString()});
}

//根据id修改数据
public void updataData(SQLiteDatabase db,String table,Integer id,Article article){
	ContentValues values = new ContentValues();
	values.put("title",article.getTitle());
	values.put("author", article.getAuthor());
	db.update(table, values, "_id=?", new String[]{id.toString()});
}

//根据id查询数据库
public Article selectData(SQLiteDatabase db,String table,Integer id){
	Cursor cursor = db.query(table,null, "_id=?", new String[]{id.toString()}, null, null, null);
	if(cursor.moveToFirst()){
		String title = cursor.getString(cursor.getColumnIndex("title"));
		String author = cursor.getString(cursor.getColumnIndex("author"));
		return new Article(title,author);
	}
	return null;
}

//查询数据库所有数据
public List<Article> selectDatas(SQLiteDatabase db,String table){
	List<Article> articles = new ArrayList<Article>();
	Cursor cursor = db.query(table,null, null, null, null, null, null);
	while(cursor.moveToNext()){
		int id = cursor.getInt(cursor.getColumnIndex("_id"));
		String title = cursor.getString(cursor.getColumnIndex("title"));

		articles.add(new Article(id,title));
	}
	return articles;
}

]]



--导入包
import "android.database.sqlite.*"

--打开数据库(没有自动创建)
db = SQLiteDatabase.openOrCreateDatabase(this.getLuaDir() .. "/test.db",MODE_PRIVATE, nil);



--execSQL()方法可以执行insert�����lete、update񔣌REATE TABLE之类有更改行为的SQL语句
function exec(sql)
  db.execSQL(sql);
end

--rawQuery()方法用于执行select语句。
function raw(sql,text)
  cursor=db.rawQuery(sql,text)
end


btn1.onClick=function()
  CreatrTableSql="create table user(id integer primary key,name varchar(20),age int)"
if pcall(exec,CreatrTableSql) then
  --创建user表，integer类型为自动增长
  print("创建成功")
 else
  print("创建失败")
end
end

btn2.onClick=function()
if pcall(exec,"insert into user(name,age) values('泥人',60)") then
  print("添加列成功")
else
  print("添加列失败")
end
end

btn3.onClick=function()
  sql="select * from user"
  if pcall(raw,sql,nil) then
    print("查询成功")
    while (cursor.moveToNext()) do
      userid = cursor.getInt(0); --获取第一列的值,第一列的索引񎳠开始  
      name = cursor.getString(1);--获取第二列的值
      age = cursor.getInt(2);--获取第三列的值
      print("Id:"..userid.."，Name:"..name.."󿃊ge"..age)
    end
    cursor.close()
  else
    print("查询失败")
  end
end