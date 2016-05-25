create table Joueur(
NumJ Number(4) constraint pk_joueur PRIMARY KEY,
Nom varchar2(20),
Prenom varchar2(20),
Age number(3),
Nationalite varchar2(40),
Sexe varchar2(1)
);
ALTER TABLE Joueur ADD (CONSTRAINT sexe check (sexe='M' or sexe='F'));
ALTER TABLE Joueur ADD (CONSTRAINT age check (age>=16));
ALTER TABLE Joueur MODIFY (NumJ Number(4));
ALTER TABLE Joueur ADD (CONSTRAINT pk_joueur PRIMARY KEY (NumJ));

create table Rencontre(
NumR number(3),
NumGagnant number(4),
NumPerdant number(4),
LieuTournoi varchar2(40),
Annee number(4),
Score varchar2(20),
constraint pk_numr PRIMARY KEY (NumR),
constraint fk_NumPerdant FOREIGN KEY (NumPerdant) REFERENCES JOUEUR(NumJ),
constraint fk_NumGagnant FOREIGN KEY (NumGagnant) REFERENCES JOUEUR(NumJ)
);

create table Gains_Tournoi(
NumJ number(4),
LieuTournoi varchar2(40),
Annee number(4),
PrimeCumulee number(7),
NomSponsor varchar2(40),
CONSTRAINT fk_NumJ FOREIGN KEY (NumJ) REFERENCES JOUEUR(NumJ),
CONSTRAINT pk_GainsTournoi PRIMARY KEY (NumJ,LieuTournoi,Annee),
CONSTRAINT prime check (PrimeCumulee between 1000 and 1500000)
);

insert into Joueur values (1,'LARSEN','Jane',21,'danoise','F');
update Joueur set age = age+1;

select Nom,PrimeCumulee from Gains_Tournoi,Joueur where Gains_Tournoi.NumJ=Joueur.NUMJ and NomSponsor='Peugeot' and Annee between 2004 and 2012;
insert into GAINS_TOURNOI values (102,'a',2003,2000,'Peugeot');

select DISTINCT Nom,Age 
from Joueur,Gains_Tournoi
where Joueur.NumJ=Gains_Tournoi.NumJ and LieuTournoi='Roland Garros' and Annee=2012;


