
select * from tblmember;
select * from tblauth;

commit;
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
				            where tblAuth.AUTH = 'ROLE_ADMIN'                                         
                     