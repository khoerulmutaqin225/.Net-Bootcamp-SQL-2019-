----- DAY 1 SEC 2 (15/8/2022)-----

---- Query adalah sebutan untuk menjalankan sql server atau biasa disebut execute

--- Filtering
select *from hr.employees

select *from hr.employees where job_id='it_prog'

select *from hr.employees where salary between 7000 and 10000

select *from hr.employees where salary >= 7000 and salary <=10000

select *from hr.employees where job_id is null


---- operator and or not
select *from hr.employees where job_id=('it_prog','fi_account') and (salary >= 7000 and salary <=10000)
select *from hr.employees where job_id=('it_prog','fi_account') or (salary >= 7000 and salary <=10000)



---- operator like
select *from hr.employees where first_name like 'j%'

-- like angka ke 2
select *from hr.employees where first_name like '_0%'

select *from hr.LOCATIONS where street_address like '[m-t]%'

select *from hr.employees where first_name like '[^D-O]%'


--- sql join
select *from hr.employees where Employee_id in (100,101,102)

--- create table EmpA from select query
select *into EmpA from hr.employees where Employee_id in (100,101,102)


--- create table EmpA from select query (Gak Punya Key)
select *into EmpB from hr.employees where Employee_id in (100,101,102,103)

----inner join
select *from EmpA a join EmpB b on a.EMPLOYEE_ID=b.EMPLOYEE_ID

---- left join
select *from EmpA a left join EmpB b on a.EMPLOYEE_ID=b.EMPLOYEE_ID

---- left join B null
select *from EmpA a left join EmpB b on a.EMPLOYEE_ID=b.EMPLOYEE_ID where b.EMPLOYEE_ID is null

---- right join
select b. *from EmpA a left join EmpB b on a.EMPLOYEE_ID=b.EMPLOYEE_ID

---- right join B null
select b.*from EmpA a left join EmpB b on a.EMPLOYEE_ID=b.EMPLOYEE_ID where a.EMPLOYEE_ID is null

---- full outer join
select *from EmpA a full outer join EmpB b on a.EMPLOYEE_ID=b.EMPLOYEE_ID
 
---- full outer full
select
select *from EmpA a full outer join EmpB b on a.EMPLOYEE_ID=b.EMPLOYEE_ID
where a.EMPLOYEE_ID is null or b. EMPLOYEE_ID is null

---countruies and location (Fillter menemukan country yang memiliki location null)
---- jangan lupa menambahkan aliassssss

---- menampilkan negara dengan lokasi nulll
select *
from hr.COUNTRIES c left join hr.LOCATIONS l
on c.country_id=l.country_id
where l.location_id is null

--- menampilkan Country dengan lokasinya
select *
from hr.COUNTRIES c  join hr.LOCATIONS l
on c.country_id=l.country_id

select * from hr.REGIONS

---menampilkan  country dan nama serta berada di regional berapa
select *from hr.COUNTRIES where country_id not in (
select distinct c.country_id
from hr.COUNTRIES c join hr.LOCATIONS l
on c.country_id=l.country_id
) 

select *from hr.COUNTRIES 

---- agregate (Menampilkan data tertinggi)
select min(salary) as min_salary,max(salary) as max_salary from hr.Employees
---- agregate (Menampilkan data lama kerja )
select min(hire_date) as lama, max(hire_date) as baru from hr.Employees
---- menampilkan pegawai terlama
select*from hr.Employees where hire_date= (select max(hire_date) from hr.Employees)
----- menampilkan rata rata bayaran
select AVG(salary) as avg_salary from hr.Employees where department_id=90


AVG(salary) as avg_salary from hr.Employees where department_id=90


---- Menam[ilkan department dengan pegawai lebi fari 5
select department_id, count(job_id)total_job
from hr.Employees
group by department_id
having count (job_id)>5

---menampilkan enmploye degan jumlah 30
select *from hr.Employees where department_id=30


select *from hr.DEPARTMENTS


----menampilkan employee dari tiap department
select d.department_id,department_name,count(employee_id) as totaL_employee
from hr.departments d join hr.employees e on d.department_id=e.department_id
group by d.department_id,department_name
order by d.department_name

--- order berfungsi mengurutkan sesuai alfabet


---menmpilkan nama departemen dan total pegawai
select d.department_id	
	,department_name
	,count(employee_id) as totaL_employee
from hr.departments d
join hr.employees e 
	on d.department_id=e.department_id
group by d.department_id,department_name

--- Menampilkan departemen tiap region (Latihan1)
select count(*)from hr.REGIONS
join hr.COUNTRIES ON hr.COUNTRIES.region_id=hr.REGIONS.region_id
join hr.LOCATIONS on hr.LOCATIONS.country_id=hr.COUNTRIES.country_id
join hr.DEPARTMENTS on hr.DEPARTMENTS.location_id=hr.LOCATIONS.location_id
group by hr.REGIONS.region_id

---1 Menampilkan departemen tiap region
select count(*) as jumlah_department, hr.REGIONS.region_id from hr.REGIONS
join hr.COUNTRIES ON hr.COUNTRIES.region_id=hr.REGIONS.region_id
join hr.LOCATIONS on hr.LOCATIONS.country_id=hr.COUNTRIES.country_id
join hr.DEPARTMENTS on hr.DEPARTMENTS.location_id=hr.LOCATIONS.location_id
group by hr.REGIONS.region_id



select* from hr.REGIONS
select*from hr.DEPARTMENTS
select *from hr.LOCATIONS
select *from hr.COUNTRIES



SELECT r.region_id,region_name
	, COUNT(department_id) as jumlah department 
FROM hr.REGIONS me 
JOIN hr.COUNTRIES c 
	ON d.district_id = ad.DISTRICT_UID
JOIN region r 
	ON ad.REGION_UID = r.REGION_UID 
GROUP BY me.district_id, ad.REGION_UID 





----menjumlahkan total pegawai
select sum(t.total_employee) as jumlah from(
select d.department_id,department_name,count(employee_id) as totaL_employee
from hr.departments d join hr.employees e on d.department_id=e.department_id
group by d.department_id,department_name)t






select *from hr.EMPLOYEES

--datetime
select employee_id,first_name,hire_date,year(hire_date)as tahun, month(hire_date) as bulan,
day(hire_date) as day
from hr.Employees

select *from hr.EMPLOYEES

--- menmapilkan berapa lama pegawi bekerja
select Employee_id,first_name,hire_date,DATEDIFF(YY,hire_date,getdate())lama_kerja
from hr.Employees





 
