drop table joueur;

/* question 1 */
/* ---------------- */
create table joueur ( 
NumJ number(4), Nom varchar2(20), prenom varchar2(20), Age number(3), Nationalite varchar2(40), Sexe varchar2(1),
constraint pk_Joueur primary key(NumJ),
constraint ck_sexe_joueur check (sexe ='M' or sexe='F'),
constraint ck_age_joueur check (age >= 16));

create table rencontre (
NumR number(3), NumGagnant number(4), NumPerdant number(4), LieuTournoi varchar2(40), Annee number(4), score varchar2(20),
constraint pk_rencontre primary key (NumR),
constraint fk_numgagnant_rencontre foreign key (NumGagnant) references Joueur(NumJ),
constraint fk_numperdant_rencontre foreign key (NumPerdant) references Joueur(NumJ));

create table Gains_Tournoi (
NumJ number(4), LieuTournoi varchar2(40), Annee number(4), PrimeCumulee number(7), NomSponsor varchar2(40),
constraint pk_GainsTournoi primary key (NumJ, LieuTournoi, Annee),
constraint fk_NumJ_GainTournoi foreign key (NumJ) references Joueur(NumJ),
constraint ck_prime_gainTournoi check (primecumulee between 1000 and 1500000) );

/*  question 2 */
/* ------------ */
insert into joueur (NumJ, nom, prenom, age, nationalite, sexe) values (102, 'LARSEN', 'Jane', 21, 'danoise', 'F');

/*  question 3 */
/* ------------ */
update joueur set age = age+1;

/*  question 4 */
/* ------------ */
select Nom, PrimeCumulee
from gains_Tournoi, Joueur
where gains_tournoi.NumJ = Joueur.NumJ and  lower(nomsponsor) = 'peugeot' and annee between 2014 and 2012;

/*  question 5 */
/* ------------ */
select distinct Nom, age
from Joueur
where NumJ in (select NumGagnant from rencontre where lower(lieutournoi) = 'roland garros' and annee = 2012) or
    NumJ in (select NumPerdant from rencontre where lower(lieutournoi) = 'roland garros' and annee = 2012);
    
 /*  question 6 */
/* ------------ */
Select Nom, Nationalite From Joueur  Where NumJ IN
(
(
(select NumGagnant From Rencontre Where lower(LieuTournoi)='roland garros' and annee=2012)
Union 
(select NumPerdant From Rencontre Where lower(LieuTournoi)='roland garros' and annee=2012)
)
Intersect 
(
(select NumGagnant From Rencontre Where lower(LieuTournoi)='wimbledon' and annee=2012)
Union 
(select NumPerdant From Rencontre Where lower(LieuTournoi)='wimbledon' and annee=2012)
)
);

/*  question 7 */
/* ------------ */
select Nom from Joueur
where NumJ in 
(select distinct NumJ
from Gains_tournoi G, rencontre R
where (G.NumJ=R.NumGagnant or G.NumJ=R.NumPerdant) and 
G.lieutournoi=R.lieutournoi and lower(R.lieutournoi) = 'roland garros' and G.annee=R.annee and primecumulee>= 500000);

/*  question 8 */
/* ------------ */
Select distinct Nom from Joueur Where NumJ in 
(
select distinct NumPerdant From rencontre where lower(LieuTournoi) = 'wimbledon' and
NumPerdant not in (select distinct NumGagnant From rencontre where lower(LieuTournoi) = 'wimbledon')
Intersect
select distinct NumGagnant From rencontre where lower(LieuTournoi) = 'roland garros' and
NumGagnant not in (select distinct NumPerdant From rencontre where lower(LieuTournoi) = 'roland garros')
);

/*  question 9 */
/* ------------ */
Select distinct NumGagnant, NumPerdant From Rencontre 
Where (NumPerdant, NumGagnant) Not In (Select NumGagnant, NumPerdant From Rencontre);

/*  question 10 */
/* ------------ */
select annee, avg(primecumulee) as moyenne_annuelle_prime
from gains_tournoi
group by annee
order by annee asc;