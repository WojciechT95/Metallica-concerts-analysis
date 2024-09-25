/* 1. Which 10 songs were played most often during the entire activity of the band? ( Count only for first ten tracks) */
 
 with first_track as
 (
 select
  `1 Track` 		
 , count(`1 Track`) as number_of_1_track_songs_played
 from metallica_data md 
 where `1 Track` <> ''
 group by 1
),
second_track as
(
 select
  `2 Track`
 , count(`2 Track`) as number_of_2_track_songs_played
 from metallica_data md 
 where `2 Track` <> ''
 group by 1
),
third_track as
(
 select
  `3 Track`
 , count(`3 Track`) as number_of_3_track_songs_played
 from metallica_data md 
 where `3 Track` <> ''
 group by 1
),
fourth_track as
(
 select
  `4 Track`
 , count(`4 Track`) as number_of_4_track_songs_played
 from metallica_data md 
 where `4 Track` <> ''
 group by 1
),
fifth_track as
(
 select
  `5 Track`
 , count(`5 Track`) as number_of_5_track_songs_played
 from metallica_data md 
 where `5 Track` <> ''
 group by 1
),
sixth_track as
(
 select
  `6 Track`
 , count(`6 Track`) as number_of_6_track_songs_played
 from metallica_data md 
 where `6 Track` <> ''
 group by 1
),
seventh_track as
(
 select
  `7 Track`
 , count(`7 Track`) as number_of_7_track_songs_played
 from metallica_data md 
 where `7 Track` <> ''
 group by 1
),
eighth_track as
(
 select
  `8 Track`
 , count(`8 Track`) as number_of_8_track_songs_played
 from metallica_data md 
 where `8 Track` <> ''
 group by 1
),
ninth_track as
(
 select
  `9 Track`
 , count(`9 Track`) as number_of_9_track_songs_played
 from metallica_data md
 where `9 Track` <> ''
 group by 1
),
tenth_track as
(
 select
  `10 Track`
 , count(`10 Track`) as number_of_10_track_songs_played
 from metallica_data md 
 where `10 Track` <> ''
 group by 1
)
 select 
mt.Track 							                                 	as  Title
 ,(COALESCE(number_of_1_track_songs_played,0) + 
 COALESCE(number_of_2_track_songs_played,0) + 
 COALESCE(number_of_3_track_songs_played,0) +
 COALESCE(number_of_4_track_songs_played,0) + 
 COALESCE(number_of_5_track_songs_played,0) + 
 COALESCE(number_of_6_track_songs_played,0) +
 COALESCE(number_of_7_track_songs_played,0) + 
 COALESCE(number_of_8_track_songs_played,0) + 
 COALESCE(number_of_9_track_songs_played,0) +
 COALESCE(number_of_10_track_songs_played,0))				                       		as Total_number_of_songs
 from metallica_track 		mt
 left join first_track 		fir		on mt.Track = fir.`1 Track`
 left join second_track 	sec		on mt.Track = sec.`2 Track`
 left join third_track 		thi		on mt.Track = thi.`3 Track`
 left join fourth_track 	fou		on mt.Track = fou.`4 Track`
 left join fifth_track 		fif		on mt.Track = fif.`5 Track`
 left join sixth_track 		six		on mt.Track = six.`6 Track`
 left join seventh_track 	sev 	     on mt.Track = sev.`7 Track`
 left join eighth_track 	eig		on mt.Track = eig.`8 Track`
 left join ninth_track 		nin     	on mt.Track = nin.`9 Track`
 left join tenth_track 		ten		on mt.Track = ten.`10 Track`
 order by 2 desc
 limit 10
 
 
/*2. In which countrues there was more than 10 concerts? */
 
select 
Country 
,count(*)			            	as Number_of_concerts
from metallica_data md 
group by 1
having count(*) > 10
order by 2 desc


/* 3. How many songs were played from each album at all the concerts? */

select 
sum(Kill_Em_All_Count)
,sum(Ride_The_Lightning_Count)
,sum(Master_Of_Puppets_Count)
,sum(And_Justice_For_All_Count)
,sum(Metallica_Count)
,sum(Load_Count)
,sum(Re_Load_Count)
,sum(Garage_Inc_Count)
,sum(St_Anger_Count)
,sum(Death_Magnetic_Count)
,sum(Hardwired_To_Self_Destruct_Count )
from metallica_data md 


/*4. In which years were there the most concerts?* What was the percentage of the total concerts? */

select 
year (`Date`)																	                                             		as Year
,count(`Date`)																			                                            as Number_of_concerts
,round((count(`Date`)/(select count(*) from metallica_data md) ) * 100,2)				as Percent_ratio
from metallica_data md 
where year(`Date`) between 1982 and 2018
group by 1
order by 2 desc

 
/*5. Which song was the most played as last track? */

select 
Last_track_Set 				as Title
,count(Last_track_Set)		as Number_of_songs_played
from metallica_data md 
where Last_track_Set <> ''
group by 1
order by 2 desc
limit 1


/*6. What was the first and the last date of playing song "For Whom the Bell Tolls" ? */

select
min(`Date`)			                            	as First_performance
,max(`Date`)			                            as Last_performance
from metallica_data md 
where
  `1 Track` = "For Whom the Bell Tolls" OR
    `2 Track` = "For Whom the Bell Tolls" OR
    `3 Track` = "For Whom the Bell Tolls" OR
    `4 Track` = "For Whom the Bell Tolls" OR
    `5 Track` = "For Whom the Bell Tolls" OR
    `6 Track` = "For Whom the Bell Tolls" OR
    `7 Track` = "For Whom the Bell Tolls" OR
    `8 Track` = "For Whom the Bell Tolls" OR
    `9 Track` = "For Whom the Bell Tolls" OR
    `10 Track` = "For Whom the Bell Tolls" OR
    `11 Track` = "For Whom the Bell Tolls" OR
    `12 Track` = "For Whom the Bell Tolls" OR
    `13 Track` = "For Whom the Bell Tolls" OR
    `14 Track` = "For Whom the Bell Tolls" OR
    `15 Track` = "For Whom the Bell Tolls" OR
    `16 Track` = "For Whom the Bell Tolls" OR
    `17 Track` = "For Whom the Bell Tolls" OR
    `18 Track` = "For Whom the Bell Tolls" OR
    `19 Track` = "For Whom the Bell Tolls" OR
    `20 Track` = "For Whom the Bell Tolls" OR
    `21 Track` = "For Whom the Bell Tolls" OR
    `22 Track` = "For Whom the Bell Tolls"

 
/*7. How many concerts were there in a given state of the united states?  */


select 
State
,count(state)				                 as Number_of_concerts
from metallica_data md 
where Country = 'United States'
group by 1
order by 2 desc
