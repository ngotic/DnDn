
select * from tblmember;

select * from tblmember where id = (select MAX(id) from tblmember);

select * from tblmember where id = (select MAX(id) from tblmember);
	select 
						*
							 from tblmember 
							 	inner join tblAuth
		          					on tblmember.id = tblAuth.id
		          						where tblmember.id = (select MAX(tblmember.id) from tblmember) and tblAuth.AUTH = 'ROLE_MEMBER';

select * from tblAuth;
--commit;
select * from tblPromise;
select od.id,shipdate,shiptime,shipperiod,dayperweek,price,orderdate,payment from tblOrder od inner join tblCart ca on ca.cartseq = od.cartseq inner join tblPeriodShip ps on ca.periodshipseq = ps.periodshipseq where od.id = '1';

	select 
	tblOrder.id , shipdate , shiptime , shipperiod , dayperweek , tblLunchBox.price , orderdate , payment ,orderseq ,tblLunchBox.name, tblPeriodShip.periodshipseq
		from tblOrder 
			inner join tblCart 
				on tblCart.cartseq = tblOrder.cartseq 
					inner join tblPeriodShip
						on tblCart.periodshipseq = tblPeriodShip.periodshipseq 
                            inner join tblSellBoard
                                on tblCart.sellboardseq = tblSellBoard.sellboardseq 
                                    inner join tblLunchboxSet
                                        on  tblSellBoard.sellboardseq =tblLunchboxSet.sellboardseq  
                                            inner join tblLunchBox
                                                on tblLunchBox.lunchboxseq = tblLunchBox.lunchboxseq
                                                     where tblOrder.id = '1';
                                                
                                                
                                                
 select * from tblAuth;
                                                
  	select 
        * 
        from tblmember  
         inner join tblAuth
          on tblmember.id = tblAuth.id
            where tblAuth.AUTH = 'ROLE_MEMBER';
       
       
       			  	select 
				        * 
				        from tblmember  
				         inner join tblAuth
				          on tblmember.id = tblAuth.id
				            where tblAuth.AUTH = 'ROLE_ADMIN';              
                            
                            
                            

--
--insert into tblEvent values (eventseq.nextVAL,'도시락 먹고 여름 JUNE비 하자',TO_DATE('2023/03/27 12:10:17','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023/04/03 23:59:59','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023/03/27 12:10:17','YYYY-MM-DD HH24:MI:SS'),27,'EC9DB82CEAB3B5ECA780.jpg','b10eee28b47b90e7b818b408f82bf12b.jpg',0); 
--insert into tblEvent values (eventseq.nextVAL,'혼밥러들을 위한 초특가 할인!',TO_DATE('2023/04/28 12:10:17','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023/05/01 23:59:59','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023/04/28 12:10:17','YYYY-MM-DD HH24:MI:SS'),15,'0428_intro.jpg','7625c248a12a9182a818856566952c53.jpg',0); 
--insert into tblEvent values (eventseq.nextVAL,'5월이라 준비했5',TO_DATE('2023/05/04 12:10:17','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023/05/14 23:59:59','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023/05/04 12:10:17','YYYY-MM-DD HH24:MI:SS'),55,'01.jpg','f11112deea6f0b432477be7fd6f496fb.jpg',0); 
--insert into tblEvent values (eventseq.nextVAL,'도시락 먹고 여름 JUNE비 하자',TO_DATE('2023/06/03 12:10:17','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023/06/11 23:59:59','YYYY-MM-DD HH24:MI:SS'),TO_DATE('2023/06/03 12:10:17','YYYY-MM-DD HH24:MI:SS'),15,'EC9DB8ED8AB8EBA19C.jpg','c81412d46bf7dd1f7f3401efa4842bed.jpg',0); 
--insert into tblEvent values (eventseq.nextVAL,'신규회원이라면 누구나!',sysdate,sysdate,sysdate+1,20,'event-content_1.jpg','event_board_1.jpg',0); 

--update tblEvent set enddate = sysdate+365 where eventseq =5;

select * from tblevent;  

select * from tblevent where enddate < sysdate;
select * from tblevent where enddate > sysdate;


select * from tblevent order by ENDDATE DESC;
select* from (select *  from tblevent order by eventseq desc ) where rownum = MAX(eventseq); 
select * from tblevent where eventseq = (select MAX(eventseq) from tblevent);
--delete from tblevent;

--Alter SEQUENCE eventseq INCREMENT by 1; SEQUENCE 초기화

--commit;

--update tblEvent set count = count+1 where eventseq = 1;



select * from tblevent where eventseq = 2+1 or eventseq = 2-1;

			select 
					* 
					from tblmember
						inner join tblAuth
		          			on tblmember.id = tblAuth.id
		          				where tblmember.id= 'Test';

	  	select 
				        * 
				        from tblmember  
				         inner join tblAuth
				          on tblmember.id = tblAuth.id
				            where tblAuth.AUTH = 'ROLE_MEMBER';
                            
select *  from tblCART;


	select 
	tblOrder.id , shipdate , shiptime , shipperiod , dayperweek , tblLunchBox.price , orderdate , payment ,orderseq ,tblLunchBox.name, tblPeriodShip.periodshipseq
		from tblOrder 
			inner join tblCart 
				on tblCart.cartseq = tblOrder.cartseq 
					inner join tblPeriodShip
						on tblCart.periodshipseq = tblPeriodShip.periodshipseq 
                            inner join tblSellBoard
                                on tblCart.sellboardseq = tblSellBoard.sellboardseq 
                                    inner join tblLunchboxSet
                                        on  tblSellBoard.sellboardseq =tblLunchboxSet.sellboardseq  
                                            inner join tblLunchBox
                                                on tblLunchBox.lunchboxseq = tblLunchBox.lunchboxseq
                                                     where tblOrder.id =  'Test';